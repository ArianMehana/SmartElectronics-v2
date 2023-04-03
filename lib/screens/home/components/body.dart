import 'package:e_commerce_v2/utilities/constants.dart';
import 'package:e_commerce_v2/models/productModel.dart';
import 'package:e_commerce_v2/screens/home/components/discountContainer.dart';
import 'package:e_commerce_v2/screens/home/components/mainProductsHeader.dart';
import 'package:e_commerce_v2/screens/home/components/popularProducts.dart';
import 'package:e_commerce_v2/screens/home/components/productCategories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/productCard.dart';
import '../../../helpers/sectionTitle.dart';
import '../../../utilities/size_config.dart';


class homeBody extends StatelessWidget {
  const homeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column( 
            children: [
              SizedBox(height: getProportionateScreenWidth(20),),
              mainProductsHeader(),
              SizedBox(height: getProportionateScreenWidth(30),),
              discountContainer(),
              SizedBox(height: getProportionateScreenWidth(30),),
              categories(),
              SizedBox(height: getProportionateScreenWidth(30),),
              popularProducts(),
              SizedBox(height: getProportionateScreenWidth(30),),
            ],
          ),
        ));
  }
}
















