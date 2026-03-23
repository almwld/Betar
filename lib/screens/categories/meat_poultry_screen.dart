import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class MeatPoultryScreen extends StatelessWidget {
  const MeatPoultryScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙØ­Ù ØºÙÙ', 'icon': Icons.agriculture, 'color': Colors.red, 'count': '89'},
    {'name': 'ÙØ­Ù Ø¨ÙØ±', 'icon': Icons.agriculture, 'color': Colors.brown, 'count': '76'},
    {'name': 'ÙØ­Ù Ø¬ÙÙ', 'icon': Icons.agriculture, 'color': Colors.amber, 'count': '45'},
    {'name': 'Ø¯Ø¬Ø§Ø¬', 'icon': Icons.pets, 'color': Colors.orange, 'count': '123'},
    {'name': 'ÙØ­Ù ÙÙØ±ÙÙ', 'icon': Icons.food_bank, 'color': Colors.red, 'count': '67'},
    {'name': 'ÙØ¨Ø¯Ø©', 'icon': Icons.food_bank, 'color': Colors.purple, 'count': '54'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙØ­ÙÙ ÙØ§ÙØ¯ÙØ§Ø¬Ù'),
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
                  Text('${cat['count']} ÙØ¬Ù', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}