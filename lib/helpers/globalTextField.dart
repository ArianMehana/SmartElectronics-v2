import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'customSuffixIcon.dart';

class globalTextField extends StatelessWidget {
  globalTextField({Key? key, required this.fieldController, required this.labelText, required this.iconPath}) : super(key: key);

  final fieldController;
  final String labelText;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10)
      ],
      onSaved: (newValue) => fieldController.text = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          //removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          //addError(error: kPhoneNumberNullError);
          return "";
        }
        // if(!phoneRegExp.hasMatch(value)){
        //   addError(error: kPhoneNumberError);
        //   return "";
        // }
        return null;
      },
      decoration: InputDecoration(
        labelText: "$labelText",
        hintText: "Your $labelText",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(svgIcon: "$iconPath"),
      ),
    );
  }
}
