import 'dart:convert'; // JSON çevirileri için gerekli
import 'package:flutter/services.dart'; // Dosya okumak (rootBundle) için gerekli
import 'package:flutter/material.dart';
import '../models/pet_product.dart';
import '../widgets/pet_product_card.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // JSON'dan okunan ürünleri tutacağımız boş liste
  List<PetProduct> products = [];
  
  // Verilerin yüklenip yüklenmediğini kontrol eden değişken
  bool isLoading = true; 

  @override
  void initState() {
    super.initState();
    // Sayfa ilk açıldığında JSON'u okumaya başla
    loadProductsFromJson();
  }

  // --- JSON OKUMA FONKSİYONU ---
  Future<void> loadProductsFromJson() async {
    try {
      // 1. JSON dosyasını bilgisayardan/assets'ten metin olarak oku
      final String response = await rootBundle.loadString('assets/data/products.json');
      
      // 2. Metni Dart'ın anlayacağı List formatına çevir
      final List<dynamic> data = json.decode(response);
      
      // 3. Çevrilen veriyi bizim PetProduct modelimize dönüştürüp listeye ekle
      setState(() {
        products = data.map((json) => PetProduct.fromJson(json)).toList();
        isLoading = false; // Yükleme bitti
      });
    } catch (e) {
      print("JSON Okuma Hatası: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void refreshCart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dostlarımıza Özel', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24, color: Colors.black87)),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black87, size: 28),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen())).then((_) => refreshCart());
                },
              ),
              if (cartItems.isNotEmpty)
                Positioned(
                  right: 8, top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(color: Color(0xFFFF7A59), shape: BoxShape.circle),
                    child: Text('${cartItems.length}', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              // Eğer JSON henüz okunuyorsa ekranda dönen bir yükleniyor ikonu göster
              child: isLoading 
                ? const Center(child: CircularProgressIndicator(color: Color(0xFFFF7A59)))
                // Okuma bittiyse ürünleri listele
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, 
                      childAspectRatio: 0.70, 
                      crossAxisSpacing: 16, 
                      mainAxisSpacing: 16
                    ),
                    itemCount: products.length, // Artık JSON'dan gelen listenin uzunluğu
                    itemBuilder: (context, index) {
                      return PetProductCard(product: products[index], onReturn: refreshCart); // Artık JSON'dan gelen ürün
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}