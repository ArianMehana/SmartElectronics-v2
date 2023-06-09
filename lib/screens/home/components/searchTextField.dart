import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';

class searchTextField extends StatelessWidget {
  const searchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      //height: 50,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {

        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Products",
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(9)),
        ),
      ),
    );
  }
}