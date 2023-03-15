import 'package:e_commerce_v2/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({Key? key}) : super(key: key);

  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: signUpBody(),
    );
  }
}
