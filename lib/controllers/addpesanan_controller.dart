import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/controllers/jumlah_controller.dart';
import 'package:kebab_ned/controllers/pesanan_controllers.dart';
import 'package:kebab_ned/models/Product.dart';

class AddPesananController extends GetxController {
  final Form_Content fc = Get.find();
  final jumlah j = Get.find();

  void addpesan(Product product) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesanan = firestore.collection('pesanan');

    try {
      if (j.total > product.stock) {
        SnackBar(content: Text("Stock Tidak Cukup"));
      }
      if (product.stock < 0) {
        SnackBar(content: Text("Stok Habis"));
      } else {
        await pesanan.add({
          'nama': fc.controllerNama.text,
          'alamat': fc.controllerAlamat.text,
          'kebab': product.title,
          'beli': j.total.toInt(),
          'harga': (j.total.toInt() * product.price),
          'No Hp': fc.controllerNoHp.text,
          'bayar': ''
        });

        product.stock = product.stock - j.total.toInt();
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Terjadi Kesalahan',
        middleText: 'Tidak Bisa menambahkan Pesanan',
        onConfirm: () => Get.back(),
        textConfirm: 'Oke',
        backgroundColor: kBackgroundColor,
        buttonColor: kTextLightColor,
      );
    }
  }
}
