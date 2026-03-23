import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class ColdDrinksScreen extends StatelessWidget {
  const ColdDrinksScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø¹ØµÙØ± Ø¨Ø±ØªÙØ§Ù', 'icon': Icons.local_drink, 'color': Colors.orange, 'count': '234'},
    {'name': 'Ø¹ØµÙØ± ØªÙØ§Ø­', 'icon': Icons.local_drink, 'color': Colors.red, 'count': '189'},
    {'name': 'Ø¹ØµÙØ± ÙØ§ÙØ¬Ù', 'icon': Icons.local_drink, 'color': Colors.orange, 'count': '156'},
    {'name': 'Ø¨ÙØ¨Ø³Ù', 'icon': Icons.local_drink, 'color': Colors.red, 'count': '345'},
    {'name': 'ÙÙØ±ÙØ¯Ø§', 'icon': Icons.local_drink, 'color': Colors.orange, 'count': '234'},
    {'name': 'Ø³ÙÙ Ø£Ø¨', 'icon': Icons.local_drink, 'color': Colors.green, 'count': '123'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙØ´Ø±ÙØ¨Ø§Øª Ø§ÙØ¨Ø§Ø±Ø¯Ø©'),
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
                  Text('${cat['count']} Ø¹ÙØ¨Ø©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}