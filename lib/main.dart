import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/navigationalRoutes.dart';
import 'package:e_commerce_v2/screens/splash/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Muli",
          textTheme: TextTheme(
            bodyLarge: TextStyle(color: kTextColor),
            bodyMedium: TextStyle(color: kTextColor)
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
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
