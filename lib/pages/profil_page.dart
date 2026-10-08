import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50, child: Icon(Icons.person, size: 60)),
            SizedBox(height: 16),
            Text('Julius Purba', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('NIM: 42325019', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
