import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/cartModel.dart';
import '../../../size_config.dart';

class cartItems extends StatelessWidget {
  const cartItems({Key? key, required this.cartItem}) : super(key: key);

  final Cart cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset(cartItem.products.images[0] as String),
            ),
          ),
        ),
        SizedBox(width: getProportionateScreenWidth(20),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cartItem.products.title, style: TextStyle(
                color: Colors.black,
                fontSize: 16
            ),
              maxLines: 2,),
            Text.rich(TextSpan(
                text: "\$${cartItem.products.price}",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600
                ),
                children: [
                  TextSpan(
                      text: " x${cartItem.itemNumber}",
                      style: TextStyle(
                          color: kTextColor
                      )
                  )
                ]
            ))
          ],
        )
      ],
    );
  }
}