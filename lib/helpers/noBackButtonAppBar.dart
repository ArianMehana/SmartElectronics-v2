import 'package:flutter/material.dart';

class customAppBar extends StatelessWidget {
  customAppBar({required this.text});

  String? text;
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(text!, style: TextStyle(
              color: Colors.black
          ),),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}



