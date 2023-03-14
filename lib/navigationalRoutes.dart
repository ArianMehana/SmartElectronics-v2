import 'package:e_commerce_v2/screens/sign_in_and_up/sign_in.dart';
import 'package:e_commerce_v2/screens/splash/splashScreen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  signInScreen.routeName : (context) => signInScreen(),
};