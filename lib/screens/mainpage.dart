import 'package:flutter/material.dart';
import 'package:kebab_ned/screens/Profil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kebab_ned/screens/menu_home/home.dart';
import 'package:kebab_ned/screens/pemesanan/riwayat.dart';

class MyMainPage extends StatefulWidget {
  MyMainPage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  final List<Widget> _children = [
    HomeScreen(),
    riwayat(),
    Profil(),
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
      label: "Profil",
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
