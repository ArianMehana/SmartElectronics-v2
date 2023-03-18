import 'package:flutter/material.dart';

import '../../../helpers/productCard.dart';
import '../../../helpers/sectionTitle.dart';
import '../../../models/productModel.dart';
import '../../../size_config.dart';

class popularProducts extends StatelessWidget {
  const popularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        sectionTitle(text: "Popular Products",onPress: (){}),
        SizedBox(height: getProportionateScreenWidth(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(demoProducts.length,
                      (index) => productCard(productSample: demoProducts[index])),
              SizedBox(width: getProportionateScreenWidth(20),)
            ],
          ),
        ),
      ],
    );
  }
}
