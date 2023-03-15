import 'package:e_commerce_v2/screens/complete_profile/complete_profile.dart';
import 'package:e_commerce_v2/screens/forgot_password/forgot_password.dart';
import 'package:e_commerce_v2/screens/sign_in/sign_in.dart';
import 'package:e_commerce_v2/screens/sign_up/sign_up.dart';
import 'package:e_commerce_v2/screens/splash/splashScreen.dart';
import 'package:e_commerce_v2/screens/successful_login/successful_login.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  signInScreen.routeName : (context) => signInScreen(),
  forgotPassword.routeName : (context) => forgotPassword(),
  successfulLogin.routeName : (context) => successfulLogin(),
  signUpScreen.routeName : (context) => signUpScreen(),
  completeProfile.routeName : (context) => completeProfile(),
};