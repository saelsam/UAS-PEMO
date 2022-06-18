import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/controllers/editpesanan_controller.dart';
import 'package:kebab_ned/models/Product.dart';
import 'package:kebab_ned/screens/menu_home/home.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/screens/pemesanan/Editpesan.dart';

class ItemCard extends StatelessWidget {
  final String nama;
  final String alamat;
  final String kebab;
  final int beli;
  final int harga;
  final String Nohp;
  final String bayar;

  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.nama, this.alamat, this.kebab, this.beli, this.harga, this.Nohp, this.bayar,
      {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesanan = firestore.collection('pesanan');
    kBackgroundColor;
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kTextLightColor)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        'Nama : $nama',
                        style: TextStyle(
                          fontWeight: reguler,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Alamat : $alamat ',
                      style: TextStyle(
                        fontWeight: reguler,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Kebab : $kebab',
                      style: TextStyle(
                        fontWeight: reguler,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Jumlah : ${beli.toInt()}',
                      style: TextStyle(
                        fontWeight: reguler,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total Harga : $harga',
                      style: TextStyle(
                        fontWeight: reguler,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'No Hp : $Nohp',
                      style: TextStyle(
                        fontWeight: reguler,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                     Text(
                      'Pembayaran : $bayar',
                      style: TextStyle(
                        fontWeight: reguler,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 40,
                      width: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.blue,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          )),
                          onPressed: () {
                             if (onUpdate != null) onUpdate!();
                            // Get.to(editpesanview());
                          }),
                    ),
                    SizedBox(
                      height: 40,
                      width: 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.red,
                          ),
                          child: Center(
                              child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          )),
                          onPressed: () {
                            if (onDelete != null) onDelete!();
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }
}

final EditPesananController ep = Get.put(EditPesananController());
