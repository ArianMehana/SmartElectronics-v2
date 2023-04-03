import 'package:e_commerce_v2/utilities/constants.dart';
import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/screens/accountVerification/components/verificationForm.dart';
import '../../../utilities/size_config.dart';
import 'package:flutter/material.dart';

class verificationBody extends StatelessWidget {
  const verificationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05,),
              Text("Verify your account",
              style: headingStyle,),
              Text("We have sent a code to your phone number. \nPlease enter the code to complete registration",
              textAlign: TextAlign.center,),
              codeTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.1,),
              verificationForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.15,),
              GestureDetector(
                onTap: (){

                },
                child: Text("Resend code",
                style: TextStyle(
                  decoration: TextDecoration.underline
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row codeTimer() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("The code will expire in "),
            TweenAnimationBuilder(tween: Tween(begin: 60.0, end: 0), duration: Duration(seconds: 60),
                builder: (context, value, child) => Text("00:${value.toInt()}s",
                style: TextStyle(
                  color: kPrimaryColor
                ),)),
          ],
        );
  }
}



