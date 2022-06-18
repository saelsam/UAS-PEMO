import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/main.dart';
import 'package:kebab_ned/models/Product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kebab_ned/screens/details_users/build.dart';
import 'package:kebab_ned/screens/mainpage_users.dart';
import 'package:kebab_ned/screens/menu_home_users/home.dart';

class details_users extends StatelessWidget {
  final Product product;

  const details_users({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: Build(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'Assets/icons/back.svg',
          color: kTextColor,
        ),
        onPressed: () => Get.back(),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home_filled, color: kTextColor),
          onPressed: () {
            // Get.off(MyMainPage_users());
            Get.offAll(() => MyMainPage_users());
          },
        ),
        const SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
