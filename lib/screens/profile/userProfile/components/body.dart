import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_v2/helpers/continueButton.dart';
import 'package:e_commerce_v2/helpers/globalTextField.dart';
import 'package:e_commerce_v2/screens/complete_profile/complete_profile.dart';
import 'package:e_commerce_v2/screens/profile/userProfile/components/updateProfile.dart';
import 'package:e_commerce_v2/screens/profile/userProfile/userProfileScreen.dart';
import 'package:e_commerce_v2/utilities/constants.dart';
import 'package:e_commerce_v2/utilities/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class userProfileBody extends StatefulWidget {
  const userProfileBody({Key? key}) : super(key: key);

  @override
  State<userProfileBody> createState() => _userProfileBodyState();
}

final List<String> errors = [];
final firstNameController = TextEditingController();
final lastNameController = TextEditingController();
final phoneNumberController = TextEditingController();
final locationController = TextEditingController();
final userId = FirebaseAuth.instance.currentUser?.uid;



class _userProfileBodyState extends State<userProfileBody> {

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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.02,),
              Text("Your profile",
                style: headingStyle,),
              Text("This your profile, click the fields to change data"),
              SizedBox(height: SizeConfig.screenHeight * 0.05,),
              updateProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
