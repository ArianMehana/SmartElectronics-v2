import 'package:flutter/material.dart';

import '../../../utilities/size_config.dart';


class roundedImageContainer extends StatelessWidget {
  const roundedImageContainer({Key? key, required this.color, required this.child}) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
          )
      ),
      child: child,
    );
  }
}
