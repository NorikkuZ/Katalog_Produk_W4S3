import 'package:flutter/material.dart';

class Product {
  final String id;
  final String nama;
  final int harga;
  final IconData icon;

  Product({
    required this.id,
    required this.nama,
    required this.harga,
    this.icon = Icons.shopping_bag_outlined,
  });
}
