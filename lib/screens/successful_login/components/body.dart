import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';

import '../../../utilities/size_config.dart';


class successLoginBody extends StatelessWidget {
  const successLoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Image(image: AssetImage("assets/images/success.png"),
          height: SizeConfig.screenHeight * 0.4,),
          SizedBox(
            height: SizeConfig.screenHeight * 0.04,
          ),
          Text("Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: ContinueButton(
              text: "Go to Home",
              onPress: () => Navigator.pushNamed(context, homeScreen.routeName),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
