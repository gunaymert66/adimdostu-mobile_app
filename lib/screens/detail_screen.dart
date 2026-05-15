import 'package:flutter/material.dart';
import '../models/pet_product.dart';

class ProductDetailScreen extends StatelessWidget {
  final PetProduct product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios, color: Colors.black), onPressed: () => Navigator.pop(context)),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 400, width: double.infinity, decoration: BoxDecoration(image: DecorationImage(image: AssetImage(product.imageUrl), fit: BoxFit.cover))),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('₺${product.price.toInt()}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFFF8B6A))),
                  const SizedBox(height: 24),
                  const Text('Açıklama', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(product.description, style: const TextStyle(color: Colors.black87, fontSize: 15, height: 1.5)),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        cartItems.add(product);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${product.name} sepete eklendi!'), backgroundColor: Colors.green, duration: const Duration(seconds: 1)));
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFFF8B6A), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                      child: const Text('Sepete Ekle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}