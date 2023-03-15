import 'package:flutter/material.dart';

class successfulLogin extends StatelessWidget {
  const successfulLogin({Key? key}) : super(key: key);
  static String routeName = "/successful_login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login success"),
        centerTitle: true,
      ),
    );
  }
}
