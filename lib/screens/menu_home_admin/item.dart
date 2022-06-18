import 'package:flutter/material.dart';
import 'package:kebab_ned/models/Product.dart';
import 'package:kebab_ned/screens/menu_home_admin/home.dart';
import 'package:kebab_ned/screens/menu_home_admin/build.dart';
import 'package:kebab_ned/screens/details_admin/details.dart';
import 'package:kebab_ned/constants.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  const ItemCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(details_admin(product: product));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBackgroundColor),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product.title,
              style: const TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "Rp. ${product.price}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
