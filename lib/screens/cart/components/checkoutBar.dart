import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../helpers/continueButton.dart';
import '../../../size_config.dart';

class checkoutBar extends StatelessWidget {
  const checkoutBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(30),
          vertical: getProportionateScreenWidth(15)
      ),
      // decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30),
      //         topRight: Radius.circular(30)
      //     ),
      //     boxShadow: [
      //       BoxShadow(
      //           offset: Offset(0, -15),
      //           color: Color(0xFFDADADA),
      //           blurRadius: 20
      //       )
      //     ]
      // ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  // decoration: BoxDecoration(
                  //   color: Color(0xFFF5F6F9),
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add Voucher"),
                const SizedBox(width: 10,),
                Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor,)
              ],
            ),
            SizedBox(height: getProportionateScreenWidth(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                          text: "\$totalPrice",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black
                          )
                      )
                    ]
                )),
                SizedBox(width: getProportionateScreenWidth(190),
                  child: ContinueButton(
                    text: "Check Out",
                    onPress: (){},
                  ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
