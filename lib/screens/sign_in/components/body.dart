import 'package:e_commerce_v2/utilities/constants.dart';
import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/screens/forgot_password/forgot_password.dart';
import 'package:e_commerce_v2/screens/sign_in/components/signForms.dart';
import 'package:e_commerce_v2/utilities/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/customSuffixIcon.dart';
import '../../../helpers/formErrors.dart';
import '../../../helpers/signUpText.dart';
import '../../../helpers/socialMedia.dart';
import '../../../utilities/size_config.dart';

class signInBody extends StatelessWidget {
  const signInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04,),
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Please sign-in with your email and password \n or continue with social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08,),
              signForms(),
              SizedBox(height: SizeConfig.screenHeight * 0.08,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialMedia(
                    icon: "assets/icons/google-icon.svg",
                    onPress: (){},
                  ),
                  socialMedia(
                    icon: "assets/icons/facebook-2.svg",
                    onPress: (){},
                  ),
                  socialMedia(
                    icon: "assets/icons/twitter.svg",
                    onPress: (){},
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              signUpText(),
            ],
          ),
        ),
      ),
    ));
  }
}











