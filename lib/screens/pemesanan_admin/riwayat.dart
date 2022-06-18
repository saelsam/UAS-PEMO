import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/controllers/pesanan_controllers.dart';
import 'package:kebab_ned/screens/pemesanan_admin/item_card_riwayat.dart';

class riwayat_admin extends StatelessWidget {
  const riwayat_admin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Form_ContentUpdate cft = Get.put(Form_ContentUpdate());
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesanan = firestore.collection('pesanan');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: Text(
          'Daftar Pesanan',
          style: TextStyle(color: kTextLightColor, fontSize: 25),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: pesanan.snapshots(),
                builder: (_, snapshot) {
                  return (snapshot.hasData)
                      ? Column(
                          children: snapshot.data!.docs
                              .map(
                                (f) => ItemCard(
                                  f.get('nama'),
                                  f.get('alamat'),
                                  f.get('kebab'),
                                  f.get('beli'),
                                  f.get('harga'),
                                  f.get('No Hp'),
                                  f.get('bayar'),
                                  onUpdate: () {
                                    pesanan.doc(f.id).update(
                                        {'bayar': f.get('bayar') + 'Lunas'});
                                  },
                                  onDelete: () {
                                    pesanan.doc(f.id).delete();
                                  },
                                ),
                              )
                              .toList(),
                        )
                      : Text('Loading...');
                },
              ),

              ///
              SizedBox(height: 150)
            ],
          ),
        ],
      ),
    );
  }
}
