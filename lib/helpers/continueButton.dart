import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/size_config.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key? key, required this.text, required this.onPress}) : super(key: key);

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(onPressed: onPress,
        child: Text(text,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white
          ),),
        style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            foregroundColor: Colors.white
        ),),
    );
  }
}