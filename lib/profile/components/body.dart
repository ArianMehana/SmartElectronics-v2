import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/profile/components/profilePicture.dart';
import 'package:e_commerce_v2/profile/components/profileWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profileBody extends StatelessWidget {
  const profileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          profilePicture(),
        SizedBox(height: 20,),
        profileWidgets(text: "My Profile",
        icon: "assets/icons/User Icon.svg",
        onPress: (){},),
        profileWidgets(text: "About Us",
        icon: "assets/icons/User Icon.svg",
        onPress: (){},),
        profileWidgets(text: "Help Center",
        icon: "assets/icons/Question mark.svg",
        onPress: (){},),
        profileWidgets(text: "Settings",
        icon: "assets/icons/Settings.svg",
        onPress: (){},),
        profileWidgets(text: "Log Out",
        icon: "assets/icons/Log out.svg",
        onPress: (){},),
      ],
    );
  }
}






