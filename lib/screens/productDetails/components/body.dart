import 'package:e_commerce_v2/utilities/constants.dart';
import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/helpers/iconButton.dart';
import 'package:e_commerce_v2/models/cartModel.dart';
import 'package:e_commerce_v2/models/productModel.dart';
import 'package:e_commerce_v2/screens/productDetails/components/productDescription.dart';
import 'package:e_commerce_v2/screens/productDetails/components/productImages.dart';
import 'package:e_commerce_v2/screens/productDetails/components/roundedContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utilities/size_config.dart';
import 'colorPicker.dart';

class productDetailsBody extends StatelessWidget {
  const productDetailsBody({Key? key, required this.products}) : super(key: key);

  final product products;

  @override
  Widget build(BuildContext context) {
    final Cart cart;
    return SingleChildScrollView(
      child: Column(
        children: [
          productImages(productPics: products,),
          roundedImageContainer( 
            color: Colors.white,
            child: Column(
              children: [
                productDescription(products: products,),
                roundedImageContainer(color: Color(0xFFF6F7F9),
                    child: Column(
                      children: [
                        colorPicker(products: products,),
                        roundedImageContainer(color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: SizeConfig.screenWidth * 0.15,
                                right: SizeConfig.screenWidth * 0.15,
                                top: getProportionateScreenWidth(15),
                                bottom: getProportionateScreenWidth(40)
                              ),
                              child: ContinueButton(text: "Add to Cart", onPress: (){
                                testCart.add(Cart(products: products, itemNumber: 1));
                              },),
                            ))
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}











