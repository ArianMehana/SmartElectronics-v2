import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utilities/size_config.dart';


class formErrorText extends StatelessWidget {
  const formErrorText({Key? key, required this.errors}) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length,
                (index) => formErrors(error: errors[index]))
    );
  }

  Row formErrors({required String error}) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/Error.svg",
          height: getProportionateScreenWidth(14),
          width: getProportionateScreenWidth(14),),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}