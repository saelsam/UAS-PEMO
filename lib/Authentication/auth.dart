import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kebab_ned/screens/Login.dart';
import 'package:kebab_ned/screens/registrasi.dart';

class authen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return tampilanLogin();
          } else {
            return Registrasi();
          }
        },
      ),
    );
  }
}
