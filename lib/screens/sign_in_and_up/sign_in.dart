import 'package:e_commerce_v2/screens/sign_in_and_up/components/body.dart';
import 'package:flutter/material.dart';

class signInScreen extends StatelessWidget {
  const signInScreen({Key? key}) : super(key: key);
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: body(),
    );
  }
}
