import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/controllers/users_controlllers.dart';
import 'package:kebab_ned/models/Product.dart';
import 'package:kebab_ned/screens/menu_home/build.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GetxUserController uc = Get.find();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Build(),
      // bottomNavigationBar: MyMainPage(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      title: Text(
        "Hello ${uc.namaLoginController.text}",
        style: TextStyle(
          fontSize: 17,
          color: kTextColor,
        ),
      ),
      leading: IconButton(
          icon: SvgPicture.asset(
            'Assets/icons/back.svg',
            color: kTextColor,
          ),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Get.back();
          }),
    );
  }
}
