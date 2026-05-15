import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profilim', style: TextStyle(fontWeight: FontWeight.w800))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(radius: 40, backgroundColor: const Color(0xFFFF7A59).withOpacity(0.1), child: const Text('A', style: TextStyle(fontSize: 32, color: Color(0xFFFF7A59)))),
                const SizedBox(width: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mert', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text('Mert@softwarepersona.com', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            _buildMenuItem(Icons.person_outline, 'Hesap Bilgileri'),
            _buildMenuItem(Icons.location_on_outlined, 'Adreslerim'),
            _buildMenuItem(Icons.payment_outlined, 'Ödeme Yöntemleri'),
            const SizedBox(height: 32),
            TextButton(onPressed: () {}, child: const Text('Çıkış Yap', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFFFF7A59)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}