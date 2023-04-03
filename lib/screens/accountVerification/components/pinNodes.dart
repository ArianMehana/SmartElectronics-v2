import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';

class pinNodes extends StatelessWidget {
  const pinNodes({Key? key, required this.nextNode, required this.currentNode, required this.pinController}) : super(key: key);

  final FocusNode currentNode;
  final FocusNode nextNode;
  final TextEditingController pinController;

  void nextField({required String value, required FocusNode focusNode}){
    if(value.length == 1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(50),
      child: TextFormField(
        controller: pinController,
        autofocus: true,
        focusNode: currentNode,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        style: TextStyle(
            fontSize: 24
        ),
        textAlign: TextAlign.center,
        decoration: verificationInputDecoration,
        onChanged: (value){
          nextField(value: value, focusNode: nextNode);
        },
      ),
    );
  }
}