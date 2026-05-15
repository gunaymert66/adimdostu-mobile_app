import 'package:flutter/material.dart';
import '../models/pet_product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    // Sepetteki toplam tutarı hesaplama
    double totalPrice = cartItems.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text(
          'Sepetim', 
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w800, fontSize: 24)
        ),
        // SİHİRLİ DOKUNUŞ BURASI: 
        // Flutter, sayfanın nereden açıldığını anlayıp geri okunu otomatik koyar veya gizler.
        automaticallyImplyLeading: true, 
        iconTheme: const IconThemeData(color: Colors.black87), // Geri okunun rengi siyah
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey[300]),
                  const SizedBox(height: 16),
                  const Text('Sepetiniz şu an boş.', style: TextStyle(fontSize: 18, color: Colors.grey)),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 15,
                              offset: const Offset(0, 8)
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(12),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item.imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 60, height: 60, 
                                  color: Colors.grey[200], 
                                  child: const Icon(Icons.pets, color: Colors.grey)
                                );
                              },
                            ),
                          ),
                          title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          subtitle: Text('₺${item.price.toInt()}', style: const TextStyle(color: Color(0xFFFF7A59), fontWeight: FontWeight.w600)),
                          trailing: IconButton(
                            icon: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(color: Colors.red[50], shape: BoxShape.circle),
                              child: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
                            ),
                            onPressed: () {
                              setState(() {
                                cartItems.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Ödeme Alanı
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))
                    ],
                  ),
                  child: SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Toplam Tutar', style: TextStyle(color: Colors.grey, fontSize: 14)),
                            Text('₺${totalPrice.toInt()}', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() { cartItems.clear(); });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Sipariş başarıyla tamamlandı!'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF7A59),
                            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          ),
                          child: const Text('Öde', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}