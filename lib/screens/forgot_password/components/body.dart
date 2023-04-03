import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/helpers/formErrors.dart';
import 'package:e_commerce_v2/helpers/signUpText.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../../utilities/constants.dart';
import '../../../helpers/customSuffixIcon.dart';
import '../../../utilities/size_config.dart';

class forgotPassBody extends StatelessWidget {
  const forgotPassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView( 
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.01,),
              Text("Forgot Password",
              style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(28),
                fontWeight: FontWeight.bold
              ),),
              Text("Please enter your email and we will send \nyou a link to reset your password",
              textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight * 0.01,),
              forgotPasswordForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class forgotPasswordForm extends StatefulWidget {
  const forgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<forgotPasswordForm> createState() => _forgotPasswordFormState();
}

class _forgotPasswordFormState extends State<forgotPasswordForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue!,
            onChanged: (value){
              if(value!.isNotEmpty && errors.contains(kEmailNullError)){   //value! should be nullable...
                setState(() {
                  errors.remove(kEmailNullError);
                });
              }
              else if(emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError))
              {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if(value!.isEmpty && !errors.contains(kEmailNullError)){   //value! should be nullable...
                setState(() {
                  errors.add(kEmailNullError);
                });
                return "";
              }
              else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError))
              {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
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
          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          formErrorText(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.01,),
          ContinueButton(text: "Continue",
          onPress: (){
            if(_formKey.currentState!.validate()){
            QuickAlert.show(context: context, type: QuickAlertType.success,
            text: "You have been sent an email to reset your account");
            }
          },),
          SizedBox(height: SizeConfig.screenHeight * 0.01,),
          signUpText(),
        ],
        ));
  }
}

