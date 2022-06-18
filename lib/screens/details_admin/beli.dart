import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebab_ned/models/Product.dart';
import 'package:kebab_ned/screens/pemesanan_admin/form.dart';

import '../../../../constants.dart';

class beli_admin extends StatelessWidget {
  const beli_admin({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          // Container(
          //   margin: const EdgeInsets.only(right: kDefaultPaddin),
          //   height: 50,
          //   width: 58,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(18),
          //     border: Border.all(),
          //   ),
          //   child: IconButton(
          //     icon: SvgPicture.asset(
          //       "Assets/icons/add_to_cart.svg",
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kTextColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                ),
                onPressed: () {
                  Get.to(form_pesan_admin(product: product));
                },
                child: Text(
                  "Beli".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
