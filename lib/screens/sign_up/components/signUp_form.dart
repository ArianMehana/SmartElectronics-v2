import 'package:e_commerce_v2/screens/complete_profile/complete_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final List<String> errors = [];

  void sign_up() async{

    try {
      if(passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text);
      }
      else {
        addError(error: "Passwords don't match");
      }
    } on FirebaseAuthException catch (e) {
      addError(error: e.code);
      print(e.message);
    }
    await Future.delayed(Duration(milliseconds: 1000));
    Navigator.pushNamed(context, completeProfile.routeName);
  }

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
                sign_up();
              }
            }),
          ],
        ));
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: confirmPasswordController,
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
        if(value!.isEmpty){
          return "";
        }
        else if(password != value){
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Re-enter your password",
        labelText: "Confirm Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",),
      ),
    );
  }

  TextFormField buildPasswordFormField2() {
    return TextFormField(
      controller: passwordController,
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
        hintText: "Enter your password",
        labelText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",),
      ),
    );
  }

  TextFormField buildEmailFormField2() {
    return TextFormField(
      controller: emailController,
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
        hintText: "Enter your e-mail",
        labelText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",),
      ),
    );
  }
}