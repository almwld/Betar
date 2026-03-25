import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class HealthBeautyScreen extends StatelessWidget {
  const HealthBeautyScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙØ³ØªØ­Ø¶Ø±Ø§Øª ØªØ¬ÙÙÙ', 'icon': Icons.face, 'color': Colors.pink, 'count': '1,234'},
    {'name': 'Ø¹ÙØ§ÙØ© Ø¨Ø§ÙØ¨Ø´Ø±Ø©', 'icon': Icons.spa, 'color': Colors.purple, 'count': '892'},
    {'name': 'Ø¹Ø·ÙØ±', 'icon': Icons.emoji_emotions, 'color': Colors.amber, 'count': '567'},
    {'name': 'ÙÙÙØ§Ø¬', 'icon': Icons.brush, 'color': Colors.red, 'count': '901'},
    {'name': 'Ø£Ø¯ÙØ§Øª Ø­ÙØ§ÙØ©', 'icon': Icons.cut, 'color': Colors.blue, 'count': '345'},
    {'name': 'Ø¹ÙØ§ÙØ© Ø¨Ø§ÙØ´Ø¹Ø±', 'icon': Icons.content_cut, 'color': Colors.teal, 'count': '678'},
    {'name': 'Ø³Ø¨Ø§ ÙÙÙØªØ¬Ø¹', 'icon': Icons.hot_tub, 'color': Colors.cyan, 'count': '234'},
    {'name': 'ØµÙØ¯ÙÙØ§Øª', 'icon': Icons.local_pharmacy, 'color': Colors.green, 'count': '456'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØµØ­Ø© ÙØ§ÙØ¬ÙØ§Ù'),
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