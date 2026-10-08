import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import 'produk_detail_page.dart';
import 'tambah_produk_page.dart';

class ProdukListPage extends StatefulWidget {
  const ProdukListPage({super.key});

  @override
  State<ProdukListPage> createState() => _ProdukListPageState();
}

class _ProdukListPageState extends State<ProdukListPage> {
  int _jumlahKeranjang = 0;

  // Minimal 5 data produk awal
  final List<Product> _daftarProduk = [
    Product(id: '1', nama: 'Kursi Minimalis', harga: 350000, icon: Icons.chair),
    Product(id: '2', nama: 'Meja Kerja Kayu', harga: 750000, icon: Icons.table_bar),
    Product(id: '3', nama: 'Lampu Meja LED', harga: 120000, icon: Icons.light),
    Product(id: '4', nama: 'Keyboard Wireless', harga: 299000, icon: Icons.keyboard),
    Product(id: '5', nama: 'Headphone Gaming', harga: 450000, icon: Icons.headphones),
  ];

  void _konfirmasiHapus(Product produk) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Produk?'),
        content: Text('Apakah Anda yakin ingin menghapus "${produk.nama}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _daftarProduk.removeWhere((p) => p.id == produk.id);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${produk.nama} berhasil dihapus')),
              );
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _bukaDetail(Product produk) async {
    final ditambah = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => ProdukDetailPage(product: produk),
      ),
    );

    if (ditambah == true) {
      setState(() {
        _jumlahKeranjang++;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${produk.nama} dimasukkan ke keranjang!')),
      );
    }
  }

  void _bukaTambahProduk() async {
    final produkBaru = await Navigator.push<Product>(
      context,
      MaterialPageRoute(builder: (context) => const TambahProdukPage()),
    );

    if (produkBaru != null) {
      setState(() {
        _daftarProduk.add(produkBaru);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produk "${produkBaru.nama}" berhasil ditambahkan!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk'),
        actions: [
          // Badge Keranjang menggunakan Stack + Positioned
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              if (_jumlahKeranjang > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                    child: Text(
                      '$_jumlahKeranjang',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _daftarProduk.isEmpty
          ? const Center(child: Text('Belum ada produk'))
          : ListView.builder(
              itemCount: _daftarProduk.length,
              itemBuilder: (context, index) {
                final produk = _daftarProduk[index];
                return ProductCard(
                  product: produk,
                  onTap: () => _bukaDetail(produk),
                  onDelete: () => _konfirmasiHapus(produk),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaTambahProduk,
        child: const Icon(Icons.add),
      ),
    );
  }
}
