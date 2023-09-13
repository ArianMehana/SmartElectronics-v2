import 'package:e_commerce_v2/helpers/checkLoginStatus.dart';
import 'package:e_commerce_v2/screens/sign_in/sign_in.dart';
import 'package:e_commerce_v2/screens/splash/components/splash_content.dart';
import 'package:flutter/material.dart';

import '../../../helpers/continueButton.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  int currentSlide = 0;
  List<Map<String, String>> splashData = [
    {
      "image": "assets/images/splash_1.png",
      "text": "Welcome to Smart Electronics"
    },
    {
      "image": "assets/images/splash_2.png",
      "text": "We provide the best Electronics around"
    },
    {
      "image": "assets/images/splash_3.png",
      "text": "Games, consoles, accesories. \nAll within your touch"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(flex: 3, child: PageView.builder(
              onPageChanged: (value){
                setState(() {
                  currentSlide = value;
                });
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index]["image"]!,
                text: splashData[index]["text"]!,
              ),
            )),
            Spacer(),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: Column(
              children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                          (index) => slideIndicator(index: index),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ContinueButton(text: "Continue", onPress: ()=>Navigator.pushNamed(context, "/auth"),),
                  ),
                SizedBox(),
              ],
            ),
                ))
          ],
        ),
      ),
    );
  }

  AnimatedContainer slideIndicator({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentSlide == index? 20:6,
      decoration: BoxDecoration(
          color: currentSlide == index? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)
      ),
    );
  }

}




