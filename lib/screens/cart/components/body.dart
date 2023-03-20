import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/models/cartModel.dart';
import 'package:e_commerce_v2/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cartItemCard.dart';

class cartBody extends StatefulWidget {
  const cartBody({Key? key}) : super(key: key);

  @override
  State<cartBody> createState() => _cartBodyState();
}

class _cartBodyState extends State<cartBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
          itemCount: testCart.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
            key: Key(testCart[index].products.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg")
                ],
              ),
            ),
            onDismissed: (direction){
              setState(() {
                testCart.removeAt(index);
              });
            },
            child: cartItems( cartItem: testCart[index],)),
          )),
    );
  }
}



