import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/helpers/formErrors.dart';
import 'package:e_commerce_v2/size_config.dart';
import 'package:flutter/material.dart';

import '../../../helpers/customSuffixIcon.dart';
import 'completeProfileForm.dart';

class completeProfileBody extends StatelessWidget {
  const completeProfileBody({Key? key}) : super(key: key);

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
              Text("Complete your profile",
              style: headingStyle,),
              Text("Complete your profile details to continue"),
              SizedBox(height: SizeConfig.screenHeight * 0.05,),
              completeProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30),),
              Text("By continuing you confirm that you \nagree with out Terms and Conditions",
                textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}



