import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

class Form_Content extends GetxController {
  var nama = "".obs;
  var alamat = "".obs;
  var noHp = "".obs;

  final controllerNama = TextEditingController();
  final controllerAlamat = TextEditingController();
  final controllerNoHp = TextEditingController();
}

class Form_ContentUpdate extends GetxController {
  var nama = "".obs;
  var alamat = "".obs;
  var noHp = "".obs;

  final controllerNamaUpdate = TextEditingController();
  final controllerAlamatUpdate = TextEditingController();
  final controllerNoHpUpdate = TextEditingController();
}
