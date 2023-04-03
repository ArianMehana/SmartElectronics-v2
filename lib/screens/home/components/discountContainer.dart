import 'package:flutter/material.dart';

import '../../../utilities/size_config.dart';


class discountContainer extends StatelessWidget {
  const discountContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),
          vertical: getProportionateScreenWidth(15)),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Text.rich(
          TextSpan(
              text: "Seasonal Discount\n",
              style: TextStyle(
                  color: Colors.white
              ),
              children:[ TextSpan(
                  text: "20% cash return",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  )
              )]
          )),
    );
  }
}
