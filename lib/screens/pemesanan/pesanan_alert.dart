import 'package:flutter/material.dart';
import 'package:kebab_ned/constants.dart';

Future<dynamic> alert(BuildContext context, String text) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kBackgroundColor,
        actions: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 20,
                    color: kTextColor,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  "Assets/centang.png",
                  height: 200,
                  width: 200,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kTextLightColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
