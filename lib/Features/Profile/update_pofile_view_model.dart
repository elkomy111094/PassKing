import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/models/failure.dart';
import '../../shared/models/user_model.dart';

class UpdateUserProfileViewModel {
  /// Constructor
  UpdateUserProfileViewModel() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.kPrimaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.kPrimaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  }

  // State management
  GenericCubit<dynamic> updateProfileCubit = GenericCubit(null);

  // Controllers
  TextEditingController nameController = TextEditingController();
  File? selectedImage;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Pick image from gallery
  Future<void> pickImage() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
        updateProfileCubit.onSuccessRequest(null);
        Logger().i("Image selected: ${pickedImage.path}");
      }
    } catch (e) {
      Logger().e("Image pick error", error: e);
      updateProfileCubit.onErrorState(
        Failure(message: 'حدث خطأ أثناء اختيار الصورة'),
      );
    }
  }

  /// Upload image to Firebase Storage
  Future<String?> _uploadImage(String uid) async {
    if (selectedImage == null) return null;
    try {
      final ref = _storage.ref().child('profile_images/$uid.jpg');
      await ref.putFile(selectedImage!);
      return await ref.getDownloadURL();
    } catch (e) {
      Logger().e("Error uploading image", error: e);
      throw Failure(message: 'فشل رفع الصورة');
    }
  }

  /// Update Firestore user data
  Future<void> updateUserData() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    updateProfileCubit.onLoadingState();

    try {
      final String name = nameController.text.trim();

      final Map<String, dynamic> dataToUpdate = {
        'name': name,
      };

      // Upload image if selected
      final imageUrl = await _uploadImage(uid);
      if (imageUrl != null) {
        dataToUpdate['image'] = imageUrl;
      }

      await _firestore.collection('users').doc(uid).update(dataToUpdate);
      await getUserData();
    } catch (e, stack) {
      Logger().e("Error updating profile", error: e, stackTrace: stack);

      updateProfileCubit.onErrorState(
        Failure(message: 'You need to subscribe to Firebase Storage.'),
      );
    }
  }

  Future<void> getUserData() async {
    try {
      // You can call Firestore to fetch user data or do other operations
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();

        if (userDoc.exists) {
          // Update the state with the user data
          updateProfileCubit.onUpdateData(
              UserModel.fromJson(userDoc.data() as Map<String, dynamic>));
        } else {
          updateProfileCubit
              .onErrorState(Failure(message: 'User data not found.'));
        }
      } else {
        // Handle the case where no user is currently logged in
        updateProfileCubit
            .onErrorState(Failure(message: 'No user is currently logged in.'));
      }
    } on Failure catch (failure) {
      updateProfileCubit.onErrorState(Failure(message: failure.message));
    } catch (e) {
      // General error handling for unexpected issues
      updateProfileCubit.onErrorState(
          Failure(message: 'Failed to retrieve user data. Please try again.'));
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    updateProfileCubit.onLoadingState();

    try {
      final user = _auth.currentUser;
      if (user == null || user.email == null) {
        throw Failure(message: 'User is not logged in.');
      }

      // Re-authenticate the user to confirm their identity
      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: currentPassword,
      );

      await user.reauthenticateWithCredential(credential);

      // Update the password
      await user.updatePassword(newPassword);

      await getUserData();
    } on FirebaseAuthException catch (e) {
      Logger().e("FirebaseAuthException", error: e);

      String errorMsg = 'An error occurred while changing the password.';
      if (e.code == 'wrong-password') {
        errorMsg = 'The current password is incorrect.';
      } else if (e.code == 'weak-password') {
        errorMsg = 'The new password is too weak.';
      }

      updateProfileCubit.onErrorState(Failure(message: errorMsg));
    } catch (e, stack) {
      Logger().e("Change password error", error: e, stackTrace: stack);

      updateProfileCubit.onErrorState(
        Failure(message: 'An unexpected error occurred. Please try again.'),
      );
    }
  }
}
