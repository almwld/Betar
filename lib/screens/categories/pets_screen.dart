import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙÙØ§Ø¨', 'icon': Icons.pets, 'color': Colors.brown, 'count': '234'},
    {'name': 'ÙØ·Ø·', 'icon': Icons.pets, 'color': Colors.orange, 'count': '345'},
    {'name': 'Ø·ÙÙØ±', 'icon': Icons.flutter_dash, 'color': Colors.blue, 'count': '123'},
    {'name': 'Ø£Ø³ÙØ§Ù', 'icon': Icons.set_meal, 'color': Colors.teal, 'count': '89'},
    {'name': 'Ø£Ø±Ø§ÙØ¨', 'icon': Icons.pets, 'color': Colors.pink, 'count': '45'},
    {'name': 'Ø£Ø¹ÙØ§Ù', 'icon': Icons.grass, 'color': Colors.green, 'count': '156'},
    {'name': 'ÙØ³ØªÙØ²ÙØ§Øª', 'icon': Icons.shopping_bag, 'color': Colors.purple, 'count': '98'},
    {'name': 'Ø£Ø¯ÙÙØ© Ø¨ÙØ·Ø±ÙØ©', 'icon': Icons.local_pharmacy, 'color': Colors.red, 'count': '67'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ­ÙÙØ§ÙØ§Øª Ø§ÙØ£ÙÙÙØ©'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: (cat['color'] as Color).withOpacity(0.3)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: (cat['color'] as Color).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(cat['icon'] as IconData, color: cat['color']),
                  ),
                  const SizedBox(height: 8),
                  Text(cat['name'], style: const TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${cat['count']} ÙÙØªØ¬', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}