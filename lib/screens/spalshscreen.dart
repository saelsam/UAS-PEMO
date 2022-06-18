import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/controllers/users_controlllers.dart';
import 'package:kebab_ned/screens/Login.dart';
import 'LandingPage.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  GetxUserController cu = Get.put(GetxUserController());
  @override
  void initState() {
    splashScreenStart();
    super.initState();
  }

  splashScreenStart() {
    var durasi = Duration(seconds: 3);
    return Timer(durasi, () {
      //Get.off((LandingPage()));
      //Get.off(() => LandingPage());
      Get.off(() => LandingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(top: 30, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                image: DecorationImage(
                  image: AssetImage(
                    "Assets/KebabNed.png",
                  ),
                ),
              ),
            ),
            Text(
              "Kebab Ned",
              style: TextStyle(fontSize: 18, color: kTextColor),
              textAlign: TextAlign.end,
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
