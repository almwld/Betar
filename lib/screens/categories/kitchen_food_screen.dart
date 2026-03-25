import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class KitchenFoodScreen extends StatelessWidget {
  const KitchenFoodScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø£ÙØ§ÙÙ ÙÙØ²ÙÙØ©', 'icon': Icons.kitchen, 'color': Colors.brown, 'count': '567'},
    {'name': 'Ø£Ø¬ÙØ²Ø© ÙØ·Ø¨Ø® ØµØºÙØ±Ø©', 'icon': Icons.coffee_maker, 'color': Colors.amber, 'count': '345'},
    {'name': 'Ø¨ÙØ§Ø±Ø§Øª ÙØªÙØ§Ø¨Ù', 'icon': Icons.grass, 'color': Colors.green, 'count': '234'},
    {'name': 'ØªÙÙØ±', 'icon': Icons.date_range, 'color': Colors.brown, 'count': '123'},
    {'name': 'Ø¹Ø³Ù', 'icon': Icons.water_drop, 'color': Colors.amber, 'count': '89'},
    {'name': 'ÙÙÙØ© ÙØ´Ø§Ù', 'icon': Icons.coffee, 'color': Colors.brown, 'count': '456'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙØ·Ø¨Ø® ÙØ§ÙØ·Ø¹Ø§Ù'),
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