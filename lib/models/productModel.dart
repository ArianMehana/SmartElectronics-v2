import 'dart:ui';

import 'package:flutter/material.dart';

class product {
  final int id;
  final String title, desc;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavorited, isPopular;

  product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavorited = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.desc,
  });
}

List<product> demoProducts = [
  product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    desc: description,
    rating: 4.8,
    isFavorited: true,
    isPopular: true,
  ),
  product(
    id: 2,
    images: [
      "assets/images/iPhone14proMax.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "iPhone 14 Pro Max - 512GB",
    price: 999.5,
    desc: description,
    rating: 4.1,
    isPopular: true,
  ),
  product(
    id: 3,
    images: [
      "assets/images/ps5controller.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Dualshock Controller for PS5",
    price: 70.55,
    desc: description,
    rating: 4.1,
    isFavorited: true,
    isPopular: true,
  ),
  product(
    id: 4,
    images: [
      "assets/images/ps5.webp",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "PlayStation 5 White - Base Edition",
    price: 599.99,
    desc: description,
    rating: 4.1,
    isFavorited: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
