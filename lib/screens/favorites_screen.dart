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
        PageHeader(title: 'المفضلة', subtitle: '${favProducts.length} منتجات محفوظة'),
        Expanded(
          child: favProducts.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B6B).withOpacity(0.08),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.favorite_outline_rounded, size: 80, color: const Color(0xFFFF6B6B).withOpacity(0.5)),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'قائمة المفضلة فارغة',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Color(0xFF2D3142)),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'احفظ منتجاتك المفضلة هنا للعودة إليها لاحقاً',
                        style: TextStyle(fontSize: 14, color: Colors.grey[500], fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(20),
                  itemCount: favProducts.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final p = favProducts[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              gradient: getLightGradient(p.bg),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(child: Text(p.image, style: const TextStyle(fontSize: 40))),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  p.name,
                                  style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: Color(0xFF2D3142)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '${p.price} ر.س',
                                  style: const TextStyle(color: Color(0xFF6C63FF), fontWeight: FontWeight.w900, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => onToggleFavorite(p),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6B6B).withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.favorite_rounded, color: Color(0xFFFF6B6B), size: 24),
                            ),
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
