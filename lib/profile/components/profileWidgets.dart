import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class profileWidgets extends StatelessWidget {
  const profileWidgets({Key? key, required this.icon, required this.text, required this.onPress}) : super(key: key);

  final String icon, text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFF5F6F9),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            padding: EdgeInsets.all(20,),
          ),
          child: Row(
            children: [
              SvgPicture.asset(icon,
                width: 22,
                color: kPrimaryColor,),
              SizedBox(width: 20,),
              Expanded(child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          )),
    );
  }
}