import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../helpers/continueButton.dart';
import '../../../helpers/customSuffixIcon.dart';
import '../../../helpers/formErrors.dart';
import '../../../size_config.dart';

class completeProfileForm extends StatefulWidget {
  const completeProfileForm({Key? key}) : super(key: key);

  @override
  State<completeProfileForm> createState() => _completeProfileFormState();
}

class _completeProfileFormState extends State<completeProfileForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> errors =[];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          key: _formKey,
          children: [
            buildFirstNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildLastNameFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildPhoneNumberFormField(),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            buildLocationFormField(),
            formErrorText(errors: errors,),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            ContinueButton(
              text: "Proceed to Products",
              onPress: (){
                if(_formKey.currentState!.validate()){
                }
              },
            ),
          ],
        ));
  }

  TextFormField buildLocationFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue!,
      onChanged: (value){
        if(value.isNotEmpty){   //value! should be nullable...
          removeError(error: kAddressNullError);
        }

        return null;
      },
      validator: (value) {
        if(value!.isEmpty){   //value! should be nullable...
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your first name",
        labelText: "First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/LocationPoint.svg",),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value){
        if(value.isNotEmpty){   //value! should be nullable...
          removeError(error: kPhoneNumberNullError);
        }

        return null;
      },
      validator: (value) {
        if(value!.isEmpty){   //value! should be nullable...
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your phone number",
        labelText: "Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/Phone.svg",),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value){
        if(value.isNotEmpty){   //value! should be nullable...
          removeError(error: kNameNullError);
        }

        return null;
      },
      validator: (value) {
        if(value!.isEmpty){   //value! should be nullable...
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your last name",
        labelText: "Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/User.svg",),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value){
        if(value.isNotEmpty){   //value! should be nullable...
          removeError(error: kNameNullError);
        }

        return null;
      },
      validator: (value) {
        if(value!.isEmpty){   //value! should be nullable...
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your first name",
        labelText: "First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/User.svg",),
      ),
    );
  }
}