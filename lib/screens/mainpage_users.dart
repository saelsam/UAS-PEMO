import 'package:flutter/material.dart';
import 'package:kebab_ned/screens/Profil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kebab_ned/screens/about_us.dart';
import 'package:kebab_ned/screens/menu_home_users/home.dart';
import 'package:kebab_ned/screens/menu_home_users/home.dart';
import 'package:kebab_ned/screens/pemesanan_users/riwayat.dart';
import 'package:kebab_ned/screens/pemesanan_users/riwayat.dart';

class MyMainPage_users extends StatefulWidget {
  MyMainPage_users({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  State<MyMainPage_users> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage_users> {
  final List<Widget> _children = [
    HomeScreen_users(),
    riwayat_users(),
    aboutus(),
  ];

  final List<BottomNavigationBarItem> _bottomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "Home",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.history),
      label: "Riwayat",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Tentang Toko",
    ),
  ];

  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(color: Colors.black38),
        currentIndex: currentIndex,
        items: _bottomItem,
        onTap: onTabTapped,
      ),
    );
  }
}
