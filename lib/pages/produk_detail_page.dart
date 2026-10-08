import 'package:flutter/material.dart';
import '../models/product.dart';

class ProdukDetailPage extends StatelessWidget {
  final Product product;

  const ProdukDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Icon(product.icon, size: 100, color: Colors.blue),
            ),
            const SizedBox(height: 24),
            Text(
              product.nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp ${product.harga}',
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add_shopping_cart),
                label: const Text('Tambah ke Keranjang'),
                onPressed: () {
                  // Mengembalikan true ke halaman sebelumnya
                  Navigator.pop(context, true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
