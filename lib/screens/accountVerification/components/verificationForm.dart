import 'package:e_commerce_v2/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../helpers/continueButton.dart';
import '../../../size_config.dart';

class verificationForm extends StatefulWidget {
  const verificationForm({Key? key}) : super(key: key);

  @override
  State<verificationForm> createState() => _verificationFormState();
}

class _verificationFormState extends State<verificationForm> {

  late FocusNode pin2Node;
  late FocusNode pin3Node;
  late FocusNode pin4Node;

  @override
  void initState() {
    super.initState();
    pin2Node = FocusNode();
    pin3Node = FocusNode();
    pin4Node = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pin2Node.dispose();
    pin3Node.dispose();
    pin4Node.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}){
    if(value.length == 1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: verificationInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin2Node);
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin2Node,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: verificationInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin3Node);
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin3Node,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: verificationInputDecoration,
                onChanged: (value){
                  nextField(value: value, focusNode: pin4Node);
                },
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(60),
              child: TextFormField(
                focusNode: pin4Node,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: verificationInputDecoration,
                onChanged: (value){
                  pin4Node.unfocus();
                },
              ),
            ),
          ],
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.15,),
        ContinueButton(text: "Cotinue", onPress: (){
          Navigator.pushNamed(context, homeScreen.routeName);
        })
      ],
    ));
  }
}