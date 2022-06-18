import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:kebab_ned/Authentication/auth.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/screens/Login.dart';
import 'package:kebab_ned/screens/menu_home_admin/home.dart';
import 'package:kebab_ned/screens/registrasi.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebab Ned'),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(top: 30, bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    image: DecorationImage(
                        image: AssetImage("Assets/KebabNed.png"))),
              ),
              Text(
                "Welcome to Kebab Ned!!!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kTextLightColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      kebab1,
                      kebab2,
                      kebab3,
                    ],
                  )),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ButtonLogin()],
          ),
        ],
      ),
    );
  }
}

//kebab

Widget kebab1 = (Container(
  width: 300,
  height: 300,
  margin: EdgeInsets.only(top: 10, right: 10, left: 10),
  alignment: Alignment.center,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  child: isikebab1,
));

Widget kebab2 = (Container(
  width: 300,
  height: 300,
  margin: EdgeInsets.only(top: 10, right: 10, left: 10),
  alignment: Alignment.center,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  child: isikebab2,
));

Widget kebab3 = (Container(
  width: 300,
  height: 300,
  margin: EdgeInsets.only(top: 10, right: 10, left: 10),
  alignment: Alignment.center,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
  ),
  child: isikebab3,
));

////
Widget isikebab1 = (Column(
  children: [
    Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("Assets/original.jpeg"),
        ),
      ),
    ),
    Text("Kebab Original", style: TextStyle(fontSize: 15, fontWeight: bold))
  ],
));

Widget isikebab2 = (Column(
  children: [
    Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("Assets/Jumbo.png"),
        ),
      ),
    ),
    Text("Kebab Komplit", style: TextStyle(fontSize: 15, fontWeight: bold)),
  ],
));

Widget isikebab3 = (Column(
  children: [
    Container(
      width: 200,
      height: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("Assets/tempe.jpeg"),
        ),
      ),
    ),
    Text(
      "Kebab Tempe",
      style: TextStyle(fontSize: 15, fontWeight: bold),
    ),
  ],
));

//Button Login
class ButtonLogin extends StatelessWidget {
  ButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.off(authen());
      }),
      child: Container(
        width: 220,
        height: 55,
        margin: EdgeInsets.only(top: 50, bottom: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: kTextLightColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          "Mulai",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
