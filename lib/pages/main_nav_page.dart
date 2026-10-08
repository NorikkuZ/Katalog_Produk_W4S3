import 'package:flutter/material.dart';
import 'produk_list_page.dart';
import 'profil_page.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int _tabAktif = 0;

  final List<Widget> _pages = const [
    ProdukListPage(),
    ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_tabAktif],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabAktif,
        onTap: (index) {
          setState(() {
            _tabAktif = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Katalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
