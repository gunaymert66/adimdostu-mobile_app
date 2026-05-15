import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; // YENİ İSKELETİMİZİ DAHİL ETTİK

void main() {
  runApp(const PetCatalogApp());
}

class PetCatalogApp extends StatelessWidget {
  const PetCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Catalog',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFAFAFA),
        primaryColor: const Color(0xFFFF7A59),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          iconTheme: IconThemeData(color: Colors.black87),
        ),
      ),
      home: const MainScreen(), // ARTIK UYGULAMA BURADAN BAŞLIYOR
    );
  }
}