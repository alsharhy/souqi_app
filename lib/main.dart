import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/models.dart';
import 'screens/screens.dart';

void main() {
  runApp(const SouqiApp());
}

class SouqiApp extends StatelessWidget {
  const SouqiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'متجر سوقي',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF0F2F8),
        textTheme: GoogleFonts.cairoTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          primary: const Color(0xFF6C63FF),
          secondary: const Color(0xFFFF6B6B),
          tertiary: const Color(0xFF00D2FF),
        ),
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  final List<CartItem> _cart = [];
  final List<int> _favorites = [8];

  void _addToCart(Product product) {
    setState(() {
      final index = _cart.indexWhere((item) => item.productId == product.id);
      if (index >= 0) {
        _cart[index].quantity++;
      } else {
        _cart.add(CartItem(productId: product.id));
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white, size: 20),
            SizedBox(width: 12),
            Text('تمت إضافة المنتج إلى السلة', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        backgroundColor: const Color(0xFF6C63FF),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }

  void _toggleFavorite(Product product) {
    setState(() {
      if (_favorites.contains(product.id)) {
        _favorites.remove(product.id);
      } else {
        _favorites.add(product.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(
          onAddToCart: _addToCart,
          onToggleFavorite: _toggleFavorite,
          favorites: _favorites),
      CategoriesScreen(
          onAddToCart: _addToCart,
          onToggleFavorite: _toggleFavorite,
          favorites: _favorites),
      CartScreen(cart: _cart, onUpdate: () => setState(() {})),
      FavoritesScreen(favorites: _favorites, onToggleFavorite: _toggleFavorite),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F8),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: screens[_currentIndex],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFF8F9FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6C63FF).withOpacity(0.12),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: const Color(0xFF6C63FF),
            unselectedItemColor: const Color(0xFFB0B5C9),
            selectedFontSize: 11,
            unselectedFontSize: 11,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: [
              const BottomNavigationBarItem(
                  icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.home_outlined)),
                  activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.home_rounded)),
                  label: 'الرئيسية'),
              const BottomNavigationBarItem(
                  icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.grid_view_outlined)),
                  activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.grid_view_rounded)),
                  label: 'الأقسام'),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Badge(
                    label: Text(_cart.length.toString(), style: const TextStyle(fontSize: 10)),
                    backgroundColor: const Color(0xFFFF6B6B),
                    isLabelVisible: _cart.isNotEmpty,
                    child: const Icon(Icons.shopping_bag_outlined),
                  ),
                ),
                activeIcon: const Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.shopping_bag_rounded)),
                label: 'السلة',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Badge(
                    label: Text(_favorites.length.toString(), style: const TextStyle(fontSize: 10)),
                    backgroundColor: const Color(0xFFFF6B6B),
                    isLabelVisible: _favorites.isNotEmpty,
                    child: const Icon(Icons.favorite_outline_rounded),
                  ),
                ),
                activeIcon: const Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.favorite_rounded)),
                label: 'المفضلة',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
