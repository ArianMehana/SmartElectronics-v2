import 'package:e_commerce_v2/enums.dart';
import 'package:e_commerce_v2/helpers/customNavBar.dart';
import 'package:e_commerce_v2/screens/home/components/body.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatelessWidget {

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: homeBody(),
      bottomNavigationBar: customNavBar(selectedMenu: menuState.home,),
    );
  }
}
