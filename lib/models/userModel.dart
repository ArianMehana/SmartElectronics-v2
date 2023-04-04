import 'package:cloud_firestore/cloud_firestore.dart';

class userModel {
  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? location;

  const userModel({
    this.userId,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.location
});

  toJSon(){
    return {"first name" : firstName,
    "last name" : lastName,
    "phone number" : phoneNumber,
    "address" : location};
  }

  factory userModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return userModel(
      userId: document.id,
      firstName: data["first name"],
      lastName: data["last name"],
      phoneNumber: data["phone number"],
      location: data["address"]
    );
  }
}

