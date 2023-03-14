import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/navigationalRoutes.dart';
import 'package:e_commerce_v2/screens/splash/splashScreen.dart';
import 'package:e_commerce_v2/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
        //home: SplashScreen(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


