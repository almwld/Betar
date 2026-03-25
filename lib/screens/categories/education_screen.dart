import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø¯ÙØ±Ø§Øª ØªØ¯Ø±ÙØ¨ÙØ©', 'icon': Icons.school, 'color': Colors.blue, 'count': '345'},
    {'name': 'ÙØªØ¨ ØªØ¹ÙÙÙÙØ©', 'icon': Icons.menu_book, 'color': Colors.green, 'count': '567'},
    {'name': 'ÙØ³ØªÙØ²ÙØ§Øª Ø¯Ø±Ø§Ø³ÙØ©', 'icon': Icons.backpack, 'color': Colors.orange, 'count': '234'},
    {'name': 'ÙØ¹Ø§ÙØ¯ ÙÙØ±Ø§ÙØ²', 'icon': Icons.location_city, 'color': Colors.purple, 'count': '89'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØªØ¹ÙÙÙ'),
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