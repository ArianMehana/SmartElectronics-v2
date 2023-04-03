import 'package:e_commerce_v2/screens/productDetails/components/body.dart';
import 'package:e_commerce_v2/screens/productDetails/components/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utilities/constants.dart';
import '../../helpers/iconButton.dart';
import '../../models/productModel.dart';

class productDetails extends StatelessWidget {
  static String routeName = "/product_details";

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as productDetailsArguments;

    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: customAppBar(rating: arguments.productPass.rating)),
      body: productDetailsBody(products: arguments.productPass,),
    );
  }
}




class productDetailsArguments{
  final product productPass;

  productDetailsArguments({required this.productPass});
}
