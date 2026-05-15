import 'package:flutter/material.dart';
import '../models/pet_product.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  Widget _getSelectedScreen(int index) {
    switch (index) {
      case 0: return const HomeScreen();
      case 1: return const CartScreen(); // Sepeti 2. sıraya aldım
      case 2: return const ProfileScreen(); // Profili 3. sıraya aldım
      default: return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        selectedItemColor: const Color(0xFFFF7A59),
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ana Sayfa'),
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'Sepetim'),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}