import 'package:e_commerce_v2/screens/complete_profile/components/body.dart';
import 'package:flutter/material.dart';

class completeProfile extends StatelessWidget {
  const completeProfile({Key? key}) : super(key: key);
  static String routeName = "/complete_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Profile"),
        centerTitle: true,
      ),
      body: completeProfileBody(),
    );
  }
}
