import 'package:e_commerce_v2/screens/forgot_password/components/body.dart';
import 'package:flutter/material.dart';

class forgotPassword extends StatelessWidget {
  const forgotPassword({Key? key}) : super(key: key);
  static String routeName = "/forgot_password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: forgotPassBody(),
    );
  }
}
