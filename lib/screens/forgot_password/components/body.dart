import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/helpers/formErrors.dart';
import 'package:e_commerce_v2/helpers/signUpText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../../utilities/constants.dart';
import '../../../helpers/customSuffixIcon.dart';
import '../../../utilities/size_config.dart';
import 'forgotPasswordForm.dart';

class forgotPassBody extends StatelessWidget {
  const forgotPassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView( 
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.01,),
              Text("Forgot Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold
              ),),
              Text("Please enter your email and we will send \nyou a link to reset your password",
              textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight * 0.01,),
              forgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}



