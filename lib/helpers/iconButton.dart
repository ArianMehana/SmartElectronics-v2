import 'package:flutter/material.dart';

import '../size_config.dart';

class iconButton extends StatelessWidget {
  const iconButton({Key? key, required this.iconData, required this.onPress}) : super(key: key);

  final IconData iconData;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(40),
      height: getProportionateScreenWidth(40),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
        ),
        onPressed: onPress,
        child: Icon(iconData),
      ),
    );
  }
}
