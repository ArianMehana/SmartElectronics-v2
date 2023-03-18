import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class categories extends StatelessWidget {

  List<Map<String, dynamic>> productCategories =[
    {"icon":"", "text":"Consoles"},
    {"icon":"", "text":"Games"},
    {"icon":"", "text":"PCs"},
    {"icon":"", "text":"Accessories"},
    {"icon":"", "text":"Smartphones"},
    //add categories here, consoles, games, PCs, accessories
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(productCategories.length, (index) => categoriesCard(icon: productCategories[index]["icon"], text: productCategories[index]["text"], onPress: (){}))
        ],
      ),
    );
  }
}

class categoriesCard extends StatelessWidget {
  const categoriesCard({Key? key, required this.icon, required this.text, required this.onPress}) : super(key: key);

  final String icon, text;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            AspectRatio(aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                    color: Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: SvgPicture.asset(icon),
              ),),
            const SizedBox(height: 5,),
            Text(text ,
              textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}