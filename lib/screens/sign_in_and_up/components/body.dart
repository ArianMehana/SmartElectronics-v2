import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/size_config.dart';
import 'package:e_commerce_v2/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../helpers/customSuffixIcon.dart';
import '../../../helpers/formErrors.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Please sign-in with your email and password \n or continue with social media",
              textAlign: TextAlign.center,
            ),
            signForms(),
          ],
        ),
      ),
    ));
  }
}

class signForms extends StatefulWidget {
  const signForms({Key? key}) : super(key: key);

  @override
  State<signForms> createState() => _signFormsState();
}

class _signFormsState extends State<signForms> {

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
      children: [
        buildEmailTextField(),
        SizedBox(height: getProportionateScreenWidth(20),),
        buildPasswordTextField(),
        SizedBox(height: getProportionateScreenWidth(20),),
        formErrorText(errors: errors),
        ContinueButton(text: "Sign in", onPress: (){},),
      ],
    ));
  }

  TextFormField buildPasswordTextField() {
    return TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: "Please enter your password",
            labelText: "Password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: customSuffixIcon(
              svgIcon: "assets/icons/Lock.svg",),
            ),
      );
  }

  TextFormField buildEmailTextField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if(value!.isEmpty){   //value! should be nullable...
            setState(() {
              errors.add("Please enter your email");
            });
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






