import 'package:dio/dio.dart';

import '../../../shared/models/failure.dart';
import '../../../shared/network/network.dart';

class LoginRepository {
  Future login({Map<String, dynamic>? data, String? devicesToken}) async {
    try {
      Response response = await Network.post("trader/login",
          data: data, devicesToken: devicesToken);
      return response.data;
    } on Failure {
      rethrow;
    }
  }

  Future getUserData() async {
    try {
      Response response = await Network.get("trader/profile");
      return response.data;
    } on Failure {
      rethrow;
    }
  }
}
