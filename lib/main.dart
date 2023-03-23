import 'package:e_commerce_v2/constants.dart';
import 'package:e_commerce_v2/navigationalRoutes.dart';
import 'package:e_commerce_v2/screens/splash/splashScreen.dart';
import 'package:e_commerce_v2/themeData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData(),
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


