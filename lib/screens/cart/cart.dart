import 'package:e_commerce_v2/utilities/constants.dart';
import 'package:e_commerce_v2/utilities/enums.dart';
import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/helpers/customNavBar.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_v2/models/cartModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'components/body.dart';
import 'components/checkoutBar.dart';

class cartMain extends StatelessWidget {

  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: cartBody(),
      bottomNavigationBar: customNavBar(selectedMenu: menuState.cart,),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text("Your Cart", style: TextStyle(
            color: Colors.black
          ),),
          Text("${testCart.length} items", style: Theme.of(context).textTheme.bodySmall,)
        ],
      ),
      centerTitle: true,
    );
  }
}


