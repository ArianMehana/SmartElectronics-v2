import 'package:e_commerce_v2/helpers/formErrors.dart';
import 'package:e_commerce_v2/screens/accountVerification/components/pinNodes.dart';
import 'package:e_commerce_v2/screens/complete_profile/components/completeProfileForm.dart';
import 'package:e_commerce_v2/screens/home/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../../utilities/constants.dart';
import '../../../helpers/continueButton.dart';
import '../../../utilities/size_config.dart';

class verificationForm extends StatefulWidget {
  const verificationForm({Key? key}) : super(key: key);

  @override
  State<verificationForm> createState() => _verificationFormState();
}

class _verificationFormState extends State<verificationForm> {

  late FocusNode pin2Node;
  late FocusNode pin1Node;
  late FocusNode pin3Node;
  late FocusNode pin4Node;
  late FocusNode pin5Node;
  late FocusNode pin6Node;

  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  final pin3Controller = TextEditingController();
  final pin4Controller = TextEditingController();
  final pin5Controller = TextEditingController();
  final pin6Controller = TextEditingController();

  var otpPin;
  final _auth = FirebaseAuth.instance;
  final List<String> errors = [];
  String? inputCode = "";

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }


  @override
  void initState() {
    pin1Node = FocusNode();
    pin2Node = FocusNode();
    pin3Node = FocusNode();
    pin4Node = FocusNode();
    pin5Node = FocusNode();
    pin6Node = FocusNode();
    super.initState();
  }



  @override
  void dispose() {
    // TODO: implement dispose
    pin1Node.dispose();
    pin2Node.dispose();
    pin3Node.dispose();
    pin4Node.dispose();
    pin5Node.dispose();
    pin6Node.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             pinNodes(currentNode: pin1Node, nextNode: pin2Node, pinController: pin1Controller),
             pinNodes(currentNode: pin2Node, nextNode: pin3Node, pinController: pin2Controller),
             pinNodes(currentNode: pin3Node, nextNode: pin4Node, pinController: pin3Controller),
             pinNodes(currentNode: pin4Node, nextNode: pin5Node, pinController: pin4Controller),
             pinNodes(currentNode: pin5Node, nextNode: pin6Node, pinController: pin5Controller),

            // Pinput(
            //   defaultPinTheme: defaultPinTheme,
            //   focusedPinTheme: focusedPinTheme,
            //   submittedPinTheme: submittedPinTheme,
            //   length: 6,
            //   showCursor: true,
            //   autofocus: true,
            //   onChanged: (value){
            //     inputCode = value;
            //     print(inputCode);
            //   },
            // )
            //
            SizedBox(
              width: getProportionateScreenWidth(50),
              child: TextFormField(
                controller: pin6Controller,
                focusNode: pin6Node,
                keyboardType: TextInputType.number,
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
                decoration: verificationInputDecoration,
                onChanged: (value){
                  inputCode = pin1Controller.text + pin2Controller.text +
                      pin3Controller.text + pin4Controller.text +
                      pin5Controller.text + pin6Controller.text;
                  print(inputCode);
                  pin6Node.unfocus();
                },
              )
            )
          ],
        ),
        formErrorText(errors: errors),
        SizedBox(height: SizeConfig.screenHeight * 0.15,),
        ContinueButton(text: "Cotinue", onPress: () async {
          try{
            PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: completeProfileForm.verId, smsCode: otpPin);

            // Sign the user in (or link) with the credential
            await _auth.signInWithCredential(credential);
            Navigator.pushNamed(context, homeScreen.routeName);
          } catch(e){
            addError(error: e.toString());
          }

        })
      ],
    ));
  }
}




