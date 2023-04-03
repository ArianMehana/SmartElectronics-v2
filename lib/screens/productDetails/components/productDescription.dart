import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/productModel.dart';
import '../../../utilities/size_config.dart';

class productDescription extends StatelessWidget {
  const productDescription({Key? key, required this.products}) : super(key: key);

  final product products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(products.title,
            style: Theme.of(context).textTheme.titleLarge,),
        ),
        const SizedBox(height: 5,),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
                color: products.isFavorited ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                )
            ),
            child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
              color: products.isFavorited
                  ? Color(0xFFFF4848)
                  : Color(0xFFDBDEE4),),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64)
          ),
          child: Text(products.desc,
            maxLines: 3,),
        )
      ],
    );
  }
}