import 'package:e_commerce_v2/screens/home/homeScreen.dart';
import 'package:e_commerce_v2/screens/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class checkLoginState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData)
            {
        return homeScreen();
            }
          else
            {
          return signInScreen();
            }
        },
      ),
    );
  }
}
