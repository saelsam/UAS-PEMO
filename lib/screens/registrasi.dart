import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kebab_ned/Authentication/auth.dart';
import 'package:kebab_ned/Utils.dart';
import 'package:kebab_ned/controllers/users_controlllers.dart';
import 'package:kebab_ned/screens/LandingPage.dart';
import 'package:kebab_ned/screens/Login.dart';
import 'package:kebab_ned/screens/mainpage_admin.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kebab_ned/constants.dart';

// GlobalKey<FormState> formKey = GlobalKey<FormState>();
FirebaseAuth auth = FirebaseAuth.instance;

class Registrasi extends StatelessWidget {
  Registrasi({Key? key}) : super(key: key);

  final GetxUserController guc = Get.put(GetxUserController());
  final GetxPasswordController gpc = Get.put(GetxPasswordController());
  final GetxEmailController gec = Get.put(GetxEmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        // key: formKey,
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Registrasi",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            SizedBox(
              height: kDefaultPaddin,
            ),
            Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                controller: gec.emailController,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Masukkan Email Yang Benar'
                        : null,
              ),
            ),
            SizedBox(
              height: kDefaultPaddin,
            ),
            Flexible(
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                ),
                controller: gpc.passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => value != null && value.length < (6)
                    ? 'Password harus lebih 6 karakter'
                    : null,
              ),
            ),
            SizedBox(
              height: kDefaultPaddin,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kTextLightColor, shadowColor: Colors.white),
              onPressed: () => signUp(),
              child: Text(
                "Daftar",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Text(
              "Sudah Punya Akun? ",
              style: TextStyle(
                fontSize: 15,
                fontWeight: bold,
                color: kTextColor,
              ),
            ),
            TextButton(
              child: Text('Login',
                  style: TextStyle(
                      color: kTextColor, fontWeight: bold, fontSize: 15)),
              onPressed: () => Get.to(tampilanLogin()),
            ),
          ],
        ),
      ),
    );
  }
}

//,,,,,,,,,,,,,,,,,,

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    Get.offAll(Registrasi());
    ec.emailController.clear();
  } catch (e) {
    throw e;
  }
}

Future signUp() async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference user = firestore.collection('user');

  // final isValid = formKey.currentState!.validate();
  // if (!isValid) return;

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: ec.emailController.text.trim(),
        password: pc.passwordController.text.trim());

    await user.add({
      'email': ec.emailController.text,
      'password': pc.passwordController.text,
    });
  } on FirebaseAuthException catch (e) {
    //print(e);

    // Get.defaultDialog(
    //   title: 'Terjadi Kesalahan',
    //   middleText: e.message.toString(),
    //   onConfirm: () => Get.back(),
    //   textConfirm: 'Oke',
    //   backgroundColor: kBackgroundColor,
    //   buttonColor: kTextLightColor,
    // );
    Utils.showSnackBar(e.message);
  }
  Get.to(tampilanLogin());
}
