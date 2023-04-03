import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities/constants.dart';
import '../models/productModel.dart';
import '../utilities/size_config.dart';

class productCard extends StatelessWidget {
  const productCard({Key? key, this.width = 140, this.aspectRatio = 1.02, required this.productSample, required this.onPress}) : super(key: key);

  final double width, aspectRatio;
  final product productSample;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: onPress,
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: aspectRatio,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSecondaryColor.withOpacity(0.1)
                  ),
                  child: Image.asset(productSample.images[0]),
                ),
              ),
              const SizedBox(height: 5,),
              Text(productSample.title,
                style: TextStyle(
                    color: Colors.black
                ),
                maxLines: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${productSample.price}",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: getProportionateScreenWidth(18)
                    ),),
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: (){},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      width: getProportionateScreenWidth(28),
                      height: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                          color: productSample.isFavorited
                              ? kPrimaryColor.withOpacity(0.15)
                              : kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle
                      ),
                      child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",
                        color: productSample.isFavorited
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}