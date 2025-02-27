import 'package:dio/dio.dart';

import '../../../shared/models/failure.dart';
import '../../../shared/network/network.dart';

class RegisterationRepository
{
  Future RegisterPhone ({required Map<String,dynamic> data  }) async {
    try {
      Response response = await Network.post("agent/otp", data: data );
      return response.data;
    } on Failure {
      rethrow;
    }
  }
  Future completeRegisteration ({required Map<String,dynamic> data  , required String token  }) async {
    try {
      Response response = await Network.post("agent/completed-data", data: data , token: token );
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx") ;
      print(response.data.toString()) ;
      return response.data;
    } on Failure {
      rethrow;
    }
  }


}