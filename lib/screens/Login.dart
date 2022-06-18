import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/Utils.dart';
import 'package:kebab_ned/controllers/users_controlllers.dart';
import 'package:kebab_ned/main.dart';
import 'package:kebab_ned/models/users.dart';
import 'package:kebab_ned/screens/mainpage_admin.dart';
import 'package:kebab_ned/screens/mainpage_users.dart';
import 'package:kebab_ned/screens/menu_home_admin/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/screens/registrasi.dart';
import 'LandingPage.dart';

final GetxUserController uc = Get.put(GetxUserController());
final GetxEmailController ec = Get.put(GetxEmailController());
final GetxPasswordController pc = Get.put(GetxPasswordController());

String admin = 'admin@gmail.com';
String pw = 'admin123';

class tampilanLogin extends StatelessWidget {
  const tampilanLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          //key: formKey,
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
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
                    labelText: "Username",
                  ),
                  controller: uc.namaLoginController,
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
                  controller: ec.emailController,
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
                  controller: pc.passwordController,
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
                    primary: kTextLightColor, shadowColor: kTextColor),
                onPressed: () {
                  signIn();
                  // Get.to(signIn);
                  pc.passwordController.clear();
                },
                child: Text("Login"),
              ),
              Text(
                "Tidak Punya akun? ",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              InkWell(
                child: new Text(
                  'Daftar Akun',
                  style: TextStyle(
                      color: kTextColor, fontSize: 15, fontWeight: bold),
                ),
                onTap: () => Get.to(Registrasi()),
              )
            ],
          ),
        ));
  }
}

Future signIn() async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: ec.emailController.text.trim(),
        password: pc.passwordController.text.trim());
  } on FirebaseAuthException catch (e) {
    print(e);
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
  if (ec.emailController.text.trim() == 'admin@gmail.com' ||
      pc.passwordController.text.trim() == 'admin123') {
    Get.offAll((MyMainPage_admin()));
    Get.defaultDialog(
      title: 'Login Berhasil',
      middleText: "Welcom Admin",
      onConfirm: () => Get.back(),
      textConfirm: 'Oke',
      backgroundColor: kBackgroundColor,
      buttonColor: kTextLightColor,
    );
  } else {
    Get.offAll(MyMainPage_users());
    Get.defaultDialog(
      title: 'Login Berhasil',
      middleText: "Welcome",
      onConfirm: () => Get.back(),
      textConfirm: 'Oke',
      backgroundColor: kBackgroundColor,
      buttonColor: kTextLightColor,
    );
  }
}
