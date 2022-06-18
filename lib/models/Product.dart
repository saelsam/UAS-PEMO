import 'package:flutter/material.dart';

class Product {
  String image, title, description, topping;
  int price, stock, id, jumlah;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.stock,
    required this.jumlah,
    required this.topping,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Kebab Tempe",
      price: 8000,
      stock: 12,
      description:
          "1. Kulit Kebab (kecil)\n2. Olahan Tempe Bumbu\n3. Selada\n4. Saus Tomat/Sambal\n5. Mayonnaise",
      image: "Assets/tempe.jpeg",
      jumlah: 0,
      topping: ""),
  Product(
      id: 2,
      title: "Kebab Kornet",
      price: 8000,
      stock: 8,
      description:
          "1. Kulit Kebab (kecil)\n2. Daging Kornet\n3. Selada\n4. Saus Tomat/Sambal\n5. Mayonnaise",
      image: "Assets/kornet.jpeg",
      jumlah: 0,
      topping: ""),
  Product(
      id: 3,
      title: "Kebab Original",
      price: 12000,
      stock: 10,
      description:
          "1. Kulit Kebab (kecil)\n2. Daging beef\n3. Selada\n4. Saus Tomat/Sambal\n5. Mayonnaise",
      image: "Assets/original.jpeg",
      jumlah: 0,
      topping: ""),
  Product(
      id: 4,
      title: "Kebab Medium",
      price: 15000,
      stock: 10,
      description:
          "1. Kulit Kebab (Besar)\n2. Daging beef\n3. Selada\n4. Saus Tomat/Sambal\n5. Mayonnaise",
      image: "Assets/sosis.jpeg",
      jumlah: 0,
      topping: ""),
  Product(
      id: 5,
      title: "Kebab Komplit",
      price: 20000,
      stock: 10,
      description:
          "1. Kulit Kebab (Besar)\n2. Daging beef\n3. Selada\n4. Saus Tomat/Sambal\n5. Mayonnaise\n6. Keju\n7. Telur",
      image: "Assets/Jumbo.png",
      jumlah: 0,
      topping: ""),
  Product(
      id: 6,
      title: "Kebab Mix",
      price: 30000,
      stock: 10,
      description: "Gabungan dari berbagai kebab",
      image: "Assets/mix.jpeg",
      jumlah: 0,
      topping: ""),
];

// String dummyText =
//     "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
