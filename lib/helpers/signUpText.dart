import 'package:e_commerce_v2/screens/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

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
          onTap: () {},
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
