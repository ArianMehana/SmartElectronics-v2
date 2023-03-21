import 'package:e_commerce_v2/profile/profile.dart';
import 'package:e_commerce_v2/screens/cart/cart.dart';
import 'package:e_commerce_v2/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:e_commerce_v2/navigationalRoutes.dart';

import '../constants.dart';
import '../enums.dart';

class customNavBar extends StatelessWidget {
  const customNavBar({Key? key, required this.selectedMenu}) : super(key: key);

  final menuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveMenuColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40)
          ),
          boxShadow: [BoxShadow(
              offset: Offset(0, -15),
              blurRadius: 20,
              color: Color(0xFFDADADA).withOpacity(0.15)
          )]
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, homeScreen.routeName),
                icon: SvgPicture.asset("assets/icons/Shop Icon.svg",
                  color: menuState.home == selectedMenu
                      ? kPrimaryColor
                      : inActiveMenuColor,)),
            // IconButton(
            //     onPressed: (){},
            //     icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
            //         color: menuState.favorite == selectedMenu
            //             ? kPrimaryColor
            //             : inActiveMenuColor)),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, cartMain.routeName),
                icon: SvgPicture.asset("assets/icons/Cart Icon.svg",
                    color: menuState.cart == selectedMenu
                        ? kPrimaryColor
                        : inActiveMenuColor)),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, profile.routeName),
                icon: SvgPicture.asset("assets/icons/User Icon.svg",
                    color: menuState.profile == selectedMenu
                        ? kPrimaryColor
                        : inActiveMenuColor)),
          ],
        ),
      ),
    );
  }
}