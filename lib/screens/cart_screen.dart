import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  final List<CartItem> cart;
  final VoidCallback onUpdate;

  const CartScreen({super.key, required this.cart, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var item in cart) {
      final p = products.firstWhere((product) => product.id == item.productId);
      total += p.price * item.quantity;
    }
    double shipping = total > 200 || total == 0 ? 0 : 25;

    return Column(
      children: [
        PageHeader(title: 'سلة التسوق', subtitle: '${cart.length} منتج في السلة'),
        Expanded(
          child: cart.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      const Text('سلة التسوق فارغة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: cart.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    final p = products.firstWhere((product) => product.id == item.productId);
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: getLightGradient(p.bg),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(child: Text(p.image, style: const TextStyle(fontSize: 40))),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                                Text(
                                  '${p.price * item.quantity} ر.س',
                                  style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w900),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle_outline, size: 20),
                                      onPressed: () {
                                        if (item.quantity > 1) {
                                          item.quantity--;
                                          onUpdate();
                                        }
                                      },
                                    ),
                                    Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                    IconButton(
                                      icon: const Icon(Icons.add_circle_outline, size: 20, color: Colors.indigo),
                                      onPressed: () {
                                        item.quantity++;
                                        onUpdate();
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () {
                              cart.removeAt(index);
                              onUpdate();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        if (cart.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, -5))],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('الإجمالي', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('$total ر.س', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('الشحن', style: TextStyle(color: Colors.grey)),
                    Text(shipping == 0 ? 'مجاني' : '$shipping ر.س', style: TextStyle(color: shipping == 0 ? Colors.green : Colors.grey)),
                  ],
                ),
                const Divider(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('الإجمالي النهائي', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                    Text('${total + shipping} ر.س', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Colors.indigo)),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('إتمام الشراء', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
