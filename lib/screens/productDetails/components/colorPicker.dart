import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../helpers/iconButton.dart';
import '../../../models/productModel.dart';
import '../../../size_config.dart';

class colorPicker extends StatelessWidget {
  const colorPicker({Key? key, required this.products}) : super(key: key);

  final product products;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 3;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(products.colors.length,
                  (index) => productColors(color: products.colors[index],
                isSelected: selectedColor == index,)
          ),
          Spacer(),
          iconButton(iconData: Icons.remove,
            onPress: (){},
          ),
          SizedBox(width: getProportionateScreenWidth(15),),
          iconButton(iconData: Icons.add, onPress: (){})
        ],
      ),
    );
  }
}


class productColors extends StatelessWidget {
  const productColors({Key? key, required this.color, this.isSelected = false}) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? kPrimaryColor : Colors.transparent)
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: color ,
            shape: BoxShape.circle
        ),
      ),
    );
  }
}