import 'package:flutter/material.dart';

import '../utilities/size_config.dart';

class sectionTitle extends StatelessWidget {
  const sectionTitle({Key? key, required this.text, required this.onPress}) : super(key: key);

  final String text;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$text",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.black
            ),),
          GestureDetector(
              onTap: onPress,
              child: Text("See more"))
        ],
      ),
    );
  }
}