import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/controllers/editpesanan_controller.dart';
import 'package:kebab_ned/controllers/addpesanan_controller.dart';
import 'package:kebab_ned/controllers/jumlah_controller.dart';
import 'package:kebab_ned/controllers/pesanan_controllers.dart';
import 'package:kebab_ned/models/Product.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kebab_ned/screens/details/beli.dart';
import 'package:kebab_ned/screens/mainpage.dart';
import 'package:kebab_ned/screens/menu_home/item.dart';
import 'package:kebab_ned/screens/pemesanan/item_card_riwayat.dart';

class editpesanview extends StatelessWidget {
  editpesanview({Key? key, this.onUpdate}) : super(key: key);

  final Function? onUpdate;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesanan = firestore.collection  ('pesanan');

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Pemesanan",
            style: TextStyle(color: kTextColor),
          ),
          backgroundColor: kBackgroundColor,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              'Assets/icons/back.svg',
              color: kTextColor,
            ),
            onPressed: () => Get.back(),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.home_filled, color: kTextColor),
              onPressed: () {
                Get.off(MyMainPage());
              },
            ),
            const SizedBox(width: kDefaultPaddin / 2)
          ],
        ),
        body:

            ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: kDefaultPaddin,
                ),
                const SizedBox(height: 20), 
                const SizedBox(height: 20),
                TextField(
                  controller: cft.controllerNamaUpdate,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nama Lengkap ",
                    hintText: 'Isi Nama Lengkap ',
                  ),
                ),
                const SizedBox(height: kDefaultPaddin),
                TextFormField(
                  maxLines: 2,
                  controller: cft.controllerAlamatUpdate,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Alamat',
                      labelText: "Isi Alamat"),
                ),
                const SizedBox(height: kDefaultPaddin),
                TextFormField(
                  controller: cft.controllerNoHpUpdate,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nomor Hp',
                      labelText: "Isi Nomor Hp"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: kDefaultPaddin),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Row(
                //       children: [
                //         GestureDetector(
                //           onTap: () {
                //             j.kurang();
                //             child:
                //             const Icon(Icons.delete);
                //           },
                //           child: Column(
                //             children: [
                //               Container(
                //                   alignment: Alignment.center,
                //                   height: 30,
                //                   width: 60,
                //                   decoration: BoxDecoration(
                //                     color: kTextLightColor,
                //                     borderRadius: BorderRadius.circular(10),
                //                   ),
                //                   child: const Icon(
                //                     Icons.remove,
                //                     color: Colors.white,
                //                   )),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //     Row(
                //       children: [
                //         GestureDetector(
                //           onTap: () {
                //             j.tambah();
                //             child:
                //             const Icon(Icons.delete);
                //           },
                //           child: Column(
                //             children: [
                //               Container(
                //                   alignment: Alignment.center,
                //                   height: 30,
                //                   width: 60,
                //                   decoration: BoxDecoration(
                //                     color: kTextLightColor,
                //                     borderRadius: BorderRadius.circular(10),
                //                   ),
                //                   child: const Icon(
                //                     Icons.add,
                //                     color: Colors.white,
                //                   )),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: kTextLightColor,
                      shadowColor: Colors.white,
                      elevation: 5),
                  onPressed: () {
                    // Get.to(pesan(product: product));
                    ep.editpesan();
                    if (onUpdate != null) onUpdate!();
                    // pesanan.add({
                    //   'nama': cft.controllerNama.text,
                    //   'alamat': cft.controllerAlamat.text,
                    //   'kebab': product.title,
                    //   'jumlah': (j.total.string),
                    //   'harga': (j.total.toInt() * product.price)
                    // });
                  },
                  child: const Text(
                    "Update",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                // TextFormField(
                //   maxLines: 3,
                //   controller: pc.controllertotal,
                //   decoration: const InputDecoration(
                //       border: OutlineInputBorder(),
                //       hintText: 'Total Harga Pembelian',
                //       labelText: "Harga"),
                // ),

                // for (var jenis in bc.bayar)
                //   Column(
                //     children: [
                //       Radio(
                //         value: jenis,
                //         groupValue: bc.groupValue,
                //         onChanged: (value) {
                //           bc.groupValue = value.toString();
                //           print(bc.groupValue);
                //           bc.update();
                //           bc.metodebayar = jenis;
                //         },
                //       ),
                //       Text(jenis),
              ],
            )
          ],
        ));
  }
  // return Center(child: CircularProgressIndicator());
}

final AddPesananController a = Get.put(AddPesananController());
final Form_ContentUpdate cft = Get.put(Form_ContentUpdate());
final jumlah j = Get.put(jumlah());

// Widget form() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       SizedBox(
//         height: kDefaultPaddin,
//       ),
//       // RichText(
//       //   text: TextSpan(children: [
//       //     TextSpan(
//       //       text: "Rp. ${product.price}",
//       //       style: TextStyle(
//       //           color: kTextColor, fontWeight: FontWeight.bold, fontSize: 25),
//       //     ),
//       //   ]),
//       // ),
//       const SizedBox(height: 20), // Margin Bohongan
//       const SizedBox(height: 20), // Margin Bohongan
//       TextField(
//         controller: cft.controllerNama,
//         decoration: const InputDecoration(
//           border: OutlineInputBorder(),
//           labelText: "Nama Lengkap ",
//           hintText: 'Isi Nama Lengkap ',
//         ),
//       ),
//       const SizedBox(height: kDefaultPaddin),
//       TextFormField(
//         maxLines: 2,
//         controller: cft.controllerAlamat,
//         decoration: const InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Alamat',
//             labelText: "Isi Alamat"),
//       ),
//       const SizedBox(height: kDefaultPaddin),
//       TextFormField(
//         controller: cft.controllerNoHp,
//         decoration: const InputDecoration(
//             border: OutlineInputBorder(),
//             hintText: 'Nomor Hp',
//             labelText: "Isi Nomor Hp"),
//         keyboardType: TextInputType.number,
//       ),
//       const SizedBox(height: kDefaultPaddin),
//       // Row(
//       //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//       //   crossAxisAlignment: CrossAxisAlignment.center,
//       //   children: [
//       //     Row(
//       //       children: [
//       //         GestureDetector(
//       //           onTap: () {
//       //             j.kurang();
//       //             child:
//       //             const Icon(Icons.delete);
//       //           },
//       //           child: Column(
//       //             children: [
//       //               Container(
//       //                   alignment: Alignment.center,
//       //                   height: 30,
//       //                   width: 60,
//       //                   decoration: BoxDecoration(
//       //                     color: kTextLightColor,
//       //                     borderRadius: BorderRadius.circular(10),
//       //                   ),
//       //                   child: const Icon(
//       //                     Icons.remove,
//       //                     color: Colors.white,
//       //                   )),
//       //             ],
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //     Row(
//       //       children: [
//       //         GestureDetector(
//       //           onTap: () {
//       //             j.tambah();
//       //             child:
//       //             const Icon(Icons.delete);
//       //           },
//       //           child: Column(
//       //             children: [
//       //               Container(
//       //                   alignment: Alignment.center,
//       //                   height: 30,
//       //                   width: 60,
//       //                   decoration: BoxDecoration(
//       //                     color: kTextLightColor,
//       //                     borderRadius: BorderRadius.circular(10),
//       //                   ),
//       //                   child: const Icon(
//       //                     Icons.add,
//       //                     color: Colors.white,
//       //                   )),
//       //             ],
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ],
//       // ),

//       ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             primary: kTextLightColor, shadowColor: Colors.white, elevation: 5),
//         onPressed: () {
//           // Get.to(pesan(product: product));
//           ep.editpesan();
//           if (onUpdate != null) onUpdate!();
//           // pesanan.add({
//           //   'nama': cft.controllerNama.text,
//           //   'alamat': cft.controllerAlamat.text,
//           //   'kebab': product.title,
//           //   'jumlah': (j.total.string),
//           //   'harga': (j.total.toInt() * product.price)
//           // });
//         },
//         child: const Text(
//           "Update",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 25),
//         ),
//       ),
//       // TextFormField(
//       //   maxLines: 3,
//       //   controller: pc.controllertotal,
//       //   decoration: const InputDecoration(
//       //       border: OutlineInputBorder(),
//       //       hintText: 'Total Harga Pembelian',
//       //       labelText: "Harga"),
//       // ),

//       // for (var jenis in bc.bayar)
//       //   Column(
//       //     children: [
//       //       Radio(
//       //         value: jenis,
//       //         groupValue: bc.groupValue,
//       //         onChanged: (value) {
//       //           bc.groupValue = value.toString();
//       //           print(bc.groupValue);
//       //           bc.update();
//       //           bc.metodebayar = jenis;
//       //         },
//       //       ),
//       //       Text(jenis),
//     ],
//   );
// }
