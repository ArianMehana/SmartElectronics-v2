import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/screens/profile/components/profilePicture.dart';
import 'package:e_commerce_v2/screens/profile/components/profileWidgets.dart';
import 'package:e_commerce_v2/screens/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class profileBody extends StatelessWidget {
  const profileBody({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    void sign_out() {
      FirebaseAuth.instance.signOut();
      Navigator.pushNamed(context, "/auth");
    }

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
        onPress: () => sign_out(),),
      ],
    );
  }
}





