import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_v2/screens/profile/userProfile/userProfileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../helpers/continueButton.dart';
import '../../../../helpers/customSuffixIcon.dart';
import '../../../../helpers/formErrors.dart';
import '../../../../models/userModel.dart';
import '../../../../utilities/constants.dart';
import '../../../../utilities/size_config.dart';

class updateProfile extends StatefulWidget {
  const updateProfile({Key? key}) : super(key: key);
  static String verId = '';


  @override
  State<updateProfile> createState() => _updateProfileState();
}

class _updateProfileState extends State<updateProfile> {

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;
  final userId = FirebaseAuth.instance.currentUser?.uid;
  String? completeNumber;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  // Future<userModel> getUserData(String userID) async{
  //   final snapshot = await _store.collection("users").where(userID)
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    firstNameController.dispose();
    lastNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future updateUser(String firstName, String lastName, String phoneNo, String address) async {
    try {
      // await FirebaseFirestore.instance.collection('users').add({
      //
      // });

      await FirebaseFirestore.instance.collection('users').doc(userId).set(
          {
            'phone number' : phoneNo,
            'first name': firstName,
            'last name': lastName,
            'address': address
          });
    }
    on FirebaseException catch (e){
      print(e.message);
    }
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
    return StreamBuilder<userModel>(
        stream: _store.collection("users").doc(_auth.currentUser!.uid)
        .snapshots().map((doc) => userModel.fromSnapshot(doc)),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return CircularProgressIndicator();
          }
          final user = snapshot.data!;
          firstNameController.text = user.firstName!;
          phoneNumberController.text = user.phoneNumber!;
          lastNameController.text = user.lastName!;
          addressController.text = user.location!;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                buildFirstNameFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildLastNameFormField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                // buildPhoneNumberFormField(),
                // SizedBox(height: getProportionateScreenHeight(30),),
                buildIntlPhoneField(),
                SizedBox(height: getProportionateScreenHeight(30)),
                buildAddressFormField(),
                formErrorText(errors: errors),
                SizedBox(height: getProportionateScreenHeight(40)),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ContinueButton(
                          text: "Back",
                          onPress: () {
                            Navigator.pushNamed(context, userProfile.routeName);
                          }
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: ContinueButton(
                        text: "Update",
                        onPress: () async{
                          if (_formKey.currentState!.validate()) {
                            updateUser(firstNameController.text.trim(), lastNameController.text.trim(),
                                completeNumber!.trim(), addressController.text.trim());
                            Navigator.pushNamed(context, userProfile.routeName);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });

  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressController,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        customSuffixIcon(svgIcon: "assets/icons/world_location.svg"),
      ),
    );
  }





  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10)
      ],
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        if(!phoneRegExp.hasMatch(value)){
          addError(error: kPhoneNumberError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  IntlPhoneField buildIntlPhoneField(){
    return IntlPhoneField(
      controller: phoneNumberController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10)
      ],
      onChanged: (value) {
        completeNumber = value.completeNumber;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: lastNameController,
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: firstNameController,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: customSuffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
