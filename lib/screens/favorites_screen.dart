import 'package:flutter/material.dart';
import '../models/models.dart';
import '../data/data.dart';
import '../widgets/widgets.dart';

class FavoritesScreen extends StatelessWidget {
  final List<int> favorites;
  final Function(Product) onToggleFavorite;

  const FavoritesScreen({super.key, required this.favorites, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    final favProducts = products.where((p) => favorites.contains(p.id)).toList();

    return Column(
      children: [
        PageHeader(title: 'المفضلة', subtitle: '${favProducts.length} منتج محفوظ'),
        Expanded(
          child: favProducts.isEmpty
              ? const Center(child: Text('لا توجد منتجات مفضلة'))
              : ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: favProducts.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final p = favProducts[index];
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
                                Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text('${p.price} ر.س', style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite, color: Colors.red),
                            onPressed: () => onToggleFavorite(p),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
