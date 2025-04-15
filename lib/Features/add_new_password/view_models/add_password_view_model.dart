import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/models/failure.dart';
import '../../../shared/models/password_model.dart';

class AddPasswordViewModel {
  /// Constructor
  /// Called When Creating An Object From This View Model == initState
  AddPasswordViewModel() {
    // Set system UI overlay style
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

  // Declare necessary variables and controllers
  GenericCubit<dynamic> addPasswordCubit = GenericCubit(null);
  GlobalKey<FormState> addPasswordFormKey = GlobalKey<FormState>();
  TextEditingController accountNameController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> addNewPassword() async {
    Logger().d("Adding new password...");

    // التأكد من صحة الفورم
    if (addPasswordFormKey.currentState?.validate() != true) return;

    addPasswordCubit.onLoadingState();

    try {
      // تجهيز البيانات من الكنترولرز
      String name = accountNameController.text.trim();
      String link = linkController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // تجهيز التاريخ الحالي
      DateTime createdAt = DateTime.now();

      // إنشاء المرجع للمستند الجديد
      final docRef = FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('passwords')
          .doc(); // ← ← ← ← ← ← ← ← توليد ID مسبقًا

      // إنشاء الكائن مع تضمين الـ id مباشرة
      AccountModel newAccount = AccountModel(
        id: docRef.id,
        name: name,
        link: link,
        email: email,
        password: password,
        createdAt: createdAt,
      );

      // إضافة البيانات إلى Firestore
      await docRef.set(newAccount.toJson());

      // النجاح
      addPasswordCubit.onUpdateData(newAccount);
    } catch (e, stack) {
      Logger().e("Error adding password", error: e, stackTrace: stack);

      addPasswordCubit.onErrorState(
        Failure(message: 'حدث خطأ أثناء حفظ كلمة المرور. حاول مرة أخرى.'),
      );
    }
  }

  Future<void> updatePassword({
    required String documentId,
  }) async {
    Logger().d("Updating password with ID: $documentId");

    if (addPasswordFormKey.currentState?.validate() == false) {
      return;
    }

    addPasswordCubit.onLoadingState();

    try {
      String name = accountNameController.text.trim();
      String link = linkController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      // تجهيز البيانات الجديدة
      final updatedData = {
        'name': name,
        'link': link,
        'email': email,
        'password': password,
        'createdAt': DateTime.now(), // يمكن تغييره حسب الحاجة
      };

      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('passwords')
          .doc(documentId)
          .update(updatedData);

      addPasswordCubit.onUpdateData("تم التحديث بنجاح ✅");
    } catch (e) {
      Logger().e("Error updating password: $e");

      addPasswordCubit.onErrorState(
        Failure(message: 'حدث خطأ أثناء تحديث كلمة المرور. حاول مرة أخرى.'),
      );
    }
  }

  Future<void> deletePassword({
    required String documentId,
  }) async {
    Logger().d("Deleting password with ID: $documentId");

    addPasswordCubit.onLoadingState();

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('passwords')
          .doc(documentId)
          .delete();

      addPasswordCubit.onUpdateData("تم الحذف بنجاح 🗑️");
    } catch (e) {
      Logger().e("Error deleting password: $e");

      addPasswordCubit.onErrorState(
        Failure(message: 'حدث خطأ أثناء حذف كلمة المرور. حاول مرة أخرى.'),
      );
    }
  }
}
