import 'package:get/get.dart';
import 'package:flutter/material.dart';

class GetxUserController extends GetxController {
  var username = "".obs;
  final namaLoginController = TextEditingController();
}

class GetxPasswordController extends GetxController {
  var password = "".obs;
  final passwordController = TextEditingController();
}

class GetxEmailController extends GetxController {
  var email = "".obs;
  final emailController = TextEditingController();
}
