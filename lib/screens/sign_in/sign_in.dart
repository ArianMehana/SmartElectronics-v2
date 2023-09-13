import 'package:e_commerce_v2/screens/sign_in/components/body.dart';
import 'package:e_commerce_v2/screens/splash/splashScreen.dart';
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
        leading: IconButton(onPressed: () { 
          Navigator.pushNamed(context, SplashScreen.routeName);
        }, icon: Icon(Icons.arrow_back_ios),),
      ),
      body: signInBody(),
    );
  }
}
