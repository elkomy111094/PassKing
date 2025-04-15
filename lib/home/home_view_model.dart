import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/generic_cubit/generic_cubit.dart';
import '../../../shared/models/failure.dart';
import '../../../shared/models/password_model.dart';

class HomeViewModel {
  HomeViewModel() {
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
  GenericCubit<dynamic> homeCubit = GenericCubit(null);
  // دالة لجلب جميع كلمات المرور للمستخدم الحالي من Firestore

  List<AccountModel>? accountsList;
  List<AccountModel>? results;
  TextEditingController searchController = TextEditingController();
  Future<void> getAllPasswords() async {
    Logger().d("Fetching all passwords...");

    try {
      // إظهار حالة التحميل
      homeCubit.onLoadingState();

      // جلب البيانات من Firestore
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('passwords')
          .get();

      // تحويل البيانات إلى قائمة من الخرائط
      List<Map<String, dynamic>> passwords = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      accountsList =
          passwords.map((password) => AccountModel.fromJson(password)).toList();

      // تحديث الحالة عند النجاح
      homeCubit.onUpdateData(passwords);
    } catch (e) {
      Logger().e("Error fetching passwords: $e");

      // معالجة الخطأ
      homeCubit.onErrorState(
        Failure(message: 'حدث خطأ أثناء جلب كلمات المرور. حاول مرة أخرى.'),
      );
    }
  }

  Future<void> searchPasswords(String query) async {
    Logger().d("Searching for: $query");

    homeCubit.onLoadingState();

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('passwords')
          .get();

      results = snapshot.docs
          .map((doc) => AccountModel.fromJson(doc.data()))
          .where((account) =>
              account.name.toLowerCase().contains(query.toLowerCase()) ||
              account.email.toLowerCase().contains(query.toLowerCase()) ||
              account.link.toLowerCase().contains(query.toLowerCase()))
          .toList();

      homeCubit.onUpdateData(results);
    } catch (e) {
      Logger().e("Error during search: $e");

      homeCubit.onErrorState(
        Failure(message: 'حدث خطأ أثناء البحث. حاول مرة أخرى.'),
      );
    }
  }
}
