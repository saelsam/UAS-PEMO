import 'package:flutter/material.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/screens/LandingPage.dart';
import 'package:kebab_ned/screens/Login.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/screens/registrasi.dart';

class aboutus extends StatelessWidget {
  const aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: kBackgroundColor,
              ),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const CircleAvatar(
                        backgroundImage: AssetImage("Assets/KebabNed.png"),
                        radius: 50.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Kebab Ned",
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: const <Widget>[
                                    Text(
                                      "Dibuka Sejak",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        // color: Colors.blueAccent,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "23 Januari 2022",
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: const <Widget>[
                                    Text(
                                      "Lokasi",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        // color: Colors.blueAccent,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "Gg. H. Kunci",
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: const <Widget>[
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'Kebab Ned ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 25, fontWeight: bold
                                          // color: Colors.blueAccent,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              "081649443597",
                                              style:
                                                  TextStyle(fontWeight: bold),
                                            ),
                                            Icon(Icons.whatsapp),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "kebabned@gmail.com",
                                              style:
                                                  TextStyle(fontWeight: bold),
                                            ),
                                            Icon(Icons.email),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .2,
                      ),
                      TextButton(
                        child: Text('Logout',
                            style: TextStyle(
                                color: kTextColor,
                                fontWeight: bold,
                                fontSize: 15)),
                        onPressed: () {
                          signOut();
                          // Get.offAll(LandingPage())
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
