import 'dart:developer';

import 'package:api_using_dio/models/signup_request_model.dart';
import 'package:api_using_dio/screens/login_screen.dart';
import 'package:api_using_dio/services/get_api_service.dart';
import 'package:api_using_dio/services/post_api_service.dart';
import 'package:api_using_dio/utils/signup_verification.dart';
import 'package:api_using_dio/widgets/radio_field.dart';
import 'package:api_using_dio/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

import '../models/signup_response_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String gender = "male";
  String status = "active";

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Widget buildBody() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: const Text("SignUp Screen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            key: _registerKey,
            child: Column(
              children: [
                TextFormFieldWidget(
                  validator: (val) {
                    return Verification.isNameValid(val);
                  },
                  obscureText: false,
                  controller: nameController,
                  text: "Name",
                ),
                TextFormFieldWidget(
                  validator: (val) {
                    return Verification.isEmailValid(val);
                  },
                  obscureText: false,
                  controller: emailController,
                  text: "Email",
                ),
                TextFormFieldWidget(
                    validator: (val) {
                      return Verification.isPasswordValid(val);
                    },
                    text: "Password",
                    obscureText: true,
                    controller: passwordController),
                RadioFieldWidget(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Gender",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: "Male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value ?? "";
                                });
                              }),
                          title: const Text("Male"),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value ?? "";
                                });
                              }),
                          title: const Text("Female"),
                        ),
                      )
                    ],
                  ),
                ),
                RadioFieldWidget(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text("Status",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: "Active",
                              groupValue: status,
                              onChanged: (value) {
                                setState(() {
                                  status = value ?? "";
                                });
                              }),
                          title: const Text("Active"),
                        ),
                      ),
                      Flexible(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Radio(
                              value: "Inactive",
                              groupValue: status,
                              onChanged: (value) {
                                setState(() {
                                  status = value ?? "";
                                });
                              }),
                          title: const Text("Inactive"),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black,
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () async {
                      if (_registerKey.currentState!.validate()) {
                        final snackBar =
                            SnackBar(content: const Text('User Registered!'));
                        SignUpRequestModel signUpRequestModel =
                            SignUpRequestModel(
                                name: nameController.text,
                                email: emailController.text,
                                gender: gender,
                                status: status);
                        bool isSuccess =
                            await PostApiService.postData(signUpRequestModel);
                        if (isSuccess) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        } else {
                          final snackBar = SnackBar(
                              content: const Text('User Not Registered!'));
                        }

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text("SignUp",
                        style: TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
