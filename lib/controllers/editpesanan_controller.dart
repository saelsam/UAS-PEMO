import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/constants.dart';
import 'package:kebab_ned/controllers/pesanan_controllers.dart';

class EditPesananController extends GetxController {
  final Form_ContentUpdate cft = Get.find();

  // Future<DocumentSnapshot<Object?>> getData(String docID) async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   DocumentReference docRef = firestore.collection('pesanan').doc(docID);
  //   return docRef.get();


    
  

  void editpesan() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference pesanan = firestore.collection('pesanan');
    
    try {
      await pesanan.doc(pesanan.id).update({
        // 'nama': cft.controllerNamaUpdate.text,
        // 'alamat': cft.controllerAlamatUpdate.text,
        // 'No Hp': cft.controllerNoHpUpdate.text,
        'nama': cft.controllerNamaUpdate.text,
        'alamat': cft.controllerAlamatUpdate.text,
        'kebab': 'apapapapa',
        'beli': 1,
        'harga': 1,
        'No Hp': cft.controllerNoHpUpdate.text,
        
      });
      Get.defaultDialog(
        title: "Berhasil Update Pesanan",
        onConfirm: () {
          Get.back();
        },
        textConfirm: "Oke",
        backgroundColor: kBackgroundColor,
        buttonColor: kTextLightColor,
      );
    } catch (e) {
      print(e);
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
