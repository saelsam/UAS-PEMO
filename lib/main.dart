import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/Utils.dart';
import 'package:kebab_ned/screens/spalshscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: Utils.showSnackBar(''),
      title: "Kebab Ned",
      initialRoute: '/',
      routes: {'/': (context) => SplashScreen()},
    );
  }
}
