import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/helpers/formErrors.dart';
import 'package:e_commerce_v2/screens/sign_up/components/signUp_form.dart';
import 'package:e_commerce_v2/size_config.dart';
import 'package:flutter/material.dart';

import '../../../helpers/customSuffixIcon.dart';
import '../../../helpers/socialMedia.dart';

class signUpBody extends StatelessWidget {
  const signUpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02,),
            Text("Register Account",
            style: headingStyle,),
              Text("Enter your details or \ncontinue with social media",
              textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight * 0.07,),
              signUpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.07,),
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
              SizedBox(height: getProportionateScreenHeight(20),),
              Text("By continuing you confirm that you \nagree with out Terms and Conditions",
              textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}



