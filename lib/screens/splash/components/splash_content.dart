import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';


class SplashContent extends StatelessWidget {
  const SplashContent({required this.image, required this.text});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Spacer(),
      Text(
        "Smart Electronics",
        style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold),
      ),
      Text(
        text,
        textAlign: TextAlign.center,
      ),
      Spacer(
        flex: 2,
      ),
      Image(
        image: AssetImage(image),
        height: getProportionateScreenHeight(265),
        width: getProportionateScreenWidth(235),
      )
    ]);
  }
}