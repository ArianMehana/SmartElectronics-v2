import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/enums.dart';
import 'package:e_commerce_v2/screens/cart/cart.dart';
import 'package:e_commerce_v2/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/customNavBar.dart';
import 'components/body.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
              centerTitle: true,
            ),
      body: profileBody(),
      bottomNavigationBar: customNavBar(selectedMenu: menuState.profile,),
    );
  }
}



