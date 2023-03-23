import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class profilePicture extends StatelessWidget {
  const profilePicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children:[
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/ps4_console_white_1.png"),
                backgroundColor: Colors.white,
              ),
              Positioned(
                bottom: 0,
                right: -10,
                child: SizedBox(
                  height: 46,
                  width: 46,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF5F6F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: BorderSide(color: Colors.white),
                        ),
                        padding: EdgeInsets.zero
                    ),),
                ),
              )
            ]),
      ),
    );
  }
}