import 'package:e_commerce_v2/screens/forgot_password/forgot_password.dart';
import 'package:e_commerce_v2/screens/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/size_config.dart';

class signUpText extends StatelessWidget {
  const signUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Dont have an account?",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16)
          ),),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, signUpScreen.routeName),
          child: Text("Sign up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: kPrimaryColor
            ),),
        )
      ],
    );
  }
}
