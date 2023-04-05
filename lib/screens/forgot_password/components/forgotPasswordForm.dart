import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../../helpers/continueButton.dart';
import '../../../helpers/customSuffixIcon.dart';
import '../../../helpers/formErrors.dart';
import '../../../helpers/signUpText.dart';
import '../../../utilities/constants.dart';
import '../../../utilities/size_config.dart';

class forgotPasswordForm extends StatefulWidget {
  const forgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<forgotPasswordForm> createState() => _forgotPasswordFormState();
}

class _forgotPasswordFormState extends State<forgotPasswordForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? email;
  final _emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try{
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      QuickAlert.show(context: context, type: QuickAlertType.success,
          text: "You have been sent an email to reset your account");
    } on FirebaseException catch (e){
      errors.add(e.message!);
      QuickAlert.show(context: context, type: QuickAlertType.error,
      text: "${e.message}");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
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
                  passwordReset();
                }
              },),
            SizedBox(height: SizeConfig.screenHeight * 0.01,),
            signUpText(),
          ],
        ));
  }
}