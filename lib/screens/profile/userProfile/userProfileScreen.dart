import 'package:e_commerce_v2/screens/profile/userProfile/components/body.dart';
import 'package:flutter/material.dart';

class userProfile extends StatelessWidget {
  const userProfile({Key? key}) : super(key: key);

  static String routeName = "/user_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Profile"),
        centerTitle: true,
      ),
      body: userProfileBody(),
    );
  }
}
