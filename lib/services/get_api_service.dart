import 'dart:developer';

import 'package:api_using_dio/models/signup_response_model.dart';
import 'package:dio/dio.dart';

// class GetApiService {
//   static Future<SignUpResponseModel?> getData() async {
//     SignUpResponseModel? signUpResponseModel;

//     try {
//       var dio = Dio();
//       Response userData = await dio.get(
//         "https://gorest.co.in/public/v2/users/",
//         // options: Options(
//         //   headers: {
//         //   "Authorization":
//         //       "Bearer 4886dfcfd3d0dd22cba3a9d2d0aac01a0c43e93259141dc48ba45a5c56f7272b"
//         // })
//       );
//       log('User Info: ${userData.data}');
//       signUpResponseModel = SignUpResponseModel.fromJson(userData.data);
//       log("<<<<<<<<<<<<<<<<<<<<<<<${signUpResponseModel.email}");
//     } catch (e) {
//       log('Error sending request!');
//     }

//     return signUpResponseModel;
//   }
// }

class GetApiService {
  static Future<SignUpResponseModel?> getData({required String id}) async {
    SignUpResponseModel? user;
    var dio = Dio();
    try {
      Response userData =
          await dio.get("https://gorest.co.in/public/v2/users/$id");

      user = SignUpResponseModel.fromJson(userData.data);
      log("${user.email}");
      log("${user.name}");
    } catch (e) {
      log('Error sending request!');
    }

    return user;
  }
}
