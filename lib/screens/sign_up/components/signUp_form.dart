import 'package:e_commerce_v2/screens/complete_profile/complete_profile.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../helpers/continueButton.dart';
import '../../../helpers/customSuffixIcon.dart';
import '../../../helpers/formErrors.dart';
import '../../../size_config.dart';

class signUpForm extends StatefulWidget {
  const signUpForm({Key? key}) : super(key: key);

  @override
  State<signUpForm> createState() => _signUpFormState();
}

class _signUpFormState extends State<signUpForm> {

  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  final List<String> errors = [];

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
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField2(),
            SizedBox(height: getProportionateScreenHeight(30),),
            buildPasswordFormField2(),
            SizedBox(height: getProportionateScreenWidth(30),),
            buildConfirmPasswordFormField(),
            formErrorText(errors: errors),
            SizedBox(height: getProportionateScreenHeight(40),),
            ContinueButton(text: "Sign Up", onPress: (){
              if(_formKey.currentState!.validate()){
              Navigator.pushNamed(context, completeProfile.routeName);
              }
            }),
          ],
        ));
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if(password == value)
        {
          removeError(error: kMatchPassError);
        }
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){   //value! should be nullable...
          return "";
        }
        else if(password != value){
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Please re-enter your password",
        labelText: "Confirm Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",),
      ),
    );
  }

  TextFormField buildPasswordFormField2() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if(value.isNotEmpty){   //value! should be nullable...
          removeError(error: kPassNullError);
        }
        else if(value.length >= 8)
        {
          removeError(error: kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){   //value! should be nullable...
          addError(error: kPassNullError);
          return "";
        }
        else if(value.length < 8){
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Please enter your password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",),
      ),
    );
  }

  TextFormField buildEmailFormField2() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value){
        if(value.isNotEmpty){   //value! should be nullable...
          removeError(error: kEmailNullError);
        }
        else if(emailValidatorRegExp.hasMatch(value))
        {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if(value!.isEmpty){   //value! should be nullable...
          addError(error: kEmailNullError);
          return "";
        }
        else if(!emailValidatorRegExp.hasMatch(value))
        {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Please enter your e-mail",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",),
      ),
    );
  }
}