import 'package:e_commerce_v2/screens/cart/cart.dart';
import 'package:e_commerce_v2/screens/home/components/searchTextField.dart';
import 'package:flutter/material.dart';

import '../../../models/cartModel.dart';
import '../../../size_config.dart';
import 'cartWithCounter.dart';

class mainProductsHeader extends StatelessWidget {
  const mainProductsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cart cart;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchTextField(),
          cartCounter(itemCounter: testCart.length,
            onPress: () => Navigator.pushNamed(context, cartMain.routeName),),
        ],
      ),
    );
  }
}
