import 'package:e_commerce_v2/screens/forgot_password/forgot_password.dart';
import 'package:e_commerce_v2/screens/successful_login/successful_login.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../helpers/continueButton.dart';
import '../../../helpers/customSuffixIcon.dart';
import '../../../helpers/formErrors.dart';
import '../../../size_config.dart';

class signForms extends StatefulWidget {
  const signForms({Key? key}) : super(key: key);

  @override
  State<signForms> createState() => _signFormsState();
}

class _signFormsState extends State<signForms> {

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? email ;
  String? password = "";
  bool? rememberMe = false;

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
            buildEmailTextField(),
            SizedBox(height: getProportionateScreenWidth(30),),
            buildPasswordTextField(),
            SizedBox(height: getProportionateScreenWidth(30),),
            Row(
              children: [
                Checkbox(value: rememberMe,
                    activeColor: kPrimaryColor,
                    onChanged: (value){
                      this.setState(() {
                        rememberMe = value!;
                      });
                    }),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, forgotPassword.routeName),
                  child: Text("Forgot Password?",
                    style: TextStyle(
                        decoration: TextDecoration.underline
                    ),),
                )
              ],
            ),
            formErrorText(errors: errors),
            SizedBox(height: getProportionateScreenWidth(20),),
            ContinueButton(text: "Sign in", onPress: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                Navigator.pushNamed(context, successfulLogin.routeName);
              }
            },),
          ],
        ));
  }

  TextFormField buildPasswordTextField() {
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

  TextFormField buildEmailTextField() {
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
        if(value!.isEmpty){
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
