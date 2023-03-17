import 'package:e_commerce_v2/screens/accountVerification/components/body.dart';
import 'package:flutter/material.dart';

class accountVerification extends StatelessWidget {
  const accountVerification({Key? key}) : super(key: key);
  static String routeName = "/verification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Verification"),
        centerTitle: true,
      ),
      body: verificationBody(),
    );
  }
}
