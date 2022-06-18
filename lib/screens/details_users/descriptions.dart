import 'package:flutter/material.dart';
import 'package:kebab_ned/models/Product.dart';

import '../../../constants.dart';

class description_users extends StatelessWidget {
  const description_users({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: const TextStyle(
            height: 1.5,
            fontWeight: bold,
            fontSize: 20,
            color: Colors.white),
      ),
    );
  }
}
