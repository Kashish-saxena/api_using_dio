import 'package:api_using_dio/services/get_api_service.dart';
import 'package:api_using_dio/utils/signup_verification.dart';
import 'package:api_using_dio/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Login Screen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            child: Column(
              children: [
                TextFormFieldWidget(
                  validator: (val) {
                    return Verification.isEmailValid(val);
                  },
                  text: "Email",
                  obscureText: false,
                  controller: emailController,
                ),
                TextFormFieldWidget(
                  validator: (value) {
                    return null;
                  },
                  text: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      GetApiService.getData();
                    },
                    child: const Text("Login",
                        style: TextStyle(color: Colors.black)),
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
