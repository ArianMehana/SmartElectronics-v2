import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../models/productModel.dart';
import '../../../utilities/size_config.dart';

class productImages extends StatefulWidget {
  const productImages({Key? key, required this.productPics}) : super(key: key);

  final product productPics;

  @override
  State<productImages> createState() => _productImagesState();
}

class _productImagesState extends State<productImages> {

  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: getProportionateScreenWidth(238),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(widget.productPics.images[selectedImage]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.productPics.images.length, (index) => buildProductPreview(index))
          ],
        )
      ],
    );
  }

  GestureDetector buildProductPreview(int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
        padding: EdgeInsets.all(getProportionateScreenHeight(8)),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: selectedImage == index
                ? kPrimaryColor : Colors.transparent)
        ),
        child: Image.asset(widget.productPics.images[index]),
      ),
    );
  }
}