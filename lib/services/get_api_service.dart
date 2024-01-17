import 'dart:convert';
import 'dart:developer';

import 'package:api_using_dio/models/signup_response_model.dart';
import 'package:dio/dio.dart';

class GetApiService {
  static Future<List<SignUpResponseModel>> getData() async {
    SignUpResponseModel? user;
    List<SignUpResponseModel> datas = [];
    List<dynamic> usersData = [];
    var dio = Dio();
    Response response;
    try {
      response = await dio.get("https://gorest.co.in/public/v2/users",
          options: Options(headers: {
            'Content-Type': "application/json",
            "Authorization":
                "Bearer 4886dfcfd3d0dd22cba3a9d2d0aac01a0c43e93259141dc48ba45a5c56f7272b"
          }));

      if (response.statusCode == 200) {
        log("response.statusCode is ${response.statusCode}"); // print the status code
        
        log("response.data is ${response.data}"); // print the response data

        usersData = response.data;
        // datas = usersData.map((e) {
        //   return SignUpResponseModel.fromJson(e);
        // }).toList();

        for (var i = 0; i < usersData.length; i++) {
          SignUpResponseModel signUpResponseModel = SignUpResponseModel(
            email: usersData[i]['email'],
            gender: usersData[i]['gender'],
            id: usersData[i]['id'],
            name: usersData[i]['name'],
            status: usersData[i]['status'],
          );
          datas.add(signUpResponseModel);
        }

        log("datas is ${datas}");

        //SignUpResponseModel.fromJson(response.data) as List;
        // signUpResponseModelFromJson(response.data) as List;
      }

      //user = SignUpResponseModel.fromJson(userData.data);

      log("${datas.length}");
    } catch (e) {
      log('Error sending request!');
    }

    return datas;
  }
}

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