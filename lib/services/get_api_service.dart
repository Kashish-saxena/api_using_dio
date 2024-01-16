import 'dart:convert';
import 'dart:developer';

import 'package:api_using_dio/models/signup_response_model.dart';
import 'package:dio/dio.dart';

class GetApiService {
  static Future<List<SignUpResponseModel>?> getData() async {
    Map<String, dynamic> responseDecoded;
    // List<dynamic> listOfData = [];
    // List<SignUpResponseModel> details = [];
    var dio = Dio();
    final dynamic response;
    response = await dio.get(
      "https://gorest.co.in/public/v2/users",
      options: Options(headers: {
        'Content-type': 'application/json',
        "Authorization":
            "Bearer 4886dfcfd3d0dd22cba3a9d2d0aac01a0c43e93259141dc48ba45a5c56f7272b"
      }),
    );

    try {
      if (response.statusCode == 200) {
        log("response.data >>>>>>>>>>>>>>> ${response.data}");
        responseDecoded = json.decode(response.data);
        // listOfData = json.decode(response.data);
        //details = json.decode(response.data);
        //signUpResponseModelFromJson(response.data);
        final List<dynamic> data = responseDecoded['data'];
        return data
            .map((dynamic e) => SignUpResponseModel.fromJson(e))
            .toList();
        // log("Details are>>>>>>>>>>>>> $details");
      }
    } catch (e) {
      log('Error in loading data $e');
    }

    return null;
  }
}
