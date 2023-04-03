import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilities/constants.dart';
import '../../../models/cartModel.dart';
import '../../../utilities/size_config.dart';

class cartCounter extends StatelessWidget {
  cartCounter({ required this.itemCounter,
    required this.onPress
  });

  int itemCounter;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      borderRadius: BorderRadius.circular(50),
      child: Stack(
          clipBehavior: Clip.none,
          children: [Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(
                12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset(
                "assets/icons/Cart Icon.svg"),
          ),
            if(itemCounter !=0)
              Positioned(
                top: -3,
                right: 0,
                child: Container(
                  height: getProportionateScreenWidth(16),
                  width: getProportionateScreenWidth(16),
                  decoration: BoxDecoration(
                      color: Color(0xFFFF4848),
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1.5, color: Colors.white)
                  ),
                  child: Center(
                      child: Text("$itemCounter",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(
                                10),
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w600
                        ),)),
                ),
              )
          ]
      ),
    );
  }
}