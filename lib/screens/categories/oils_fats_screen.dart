import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class OilsFatsScreen extends StatelessWidget {
  const OilsFatsScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø²ÙØª Ø²ÙØªÙÙ', 'icon': Icons.opacity, 'color': Colors.green, 'count': '234'},
    {'name': 'Ø²ÙØª Ø¯ÙØ§Ø± Ø§ÙØ´ÙØ³', 'icon': Icons.opacity, 'color': Colors.yellow, 'count': '189'},
    {'name': 'Ø²ÙØª Ø°Ø±Ø©', 'icon': Icons.opacity, 'color': Colors.orange, 'count': '156'},
    {'name': 'Ø³ÙÙ', 'icon': Icons.opacity, 'color': Colors.yellow, 'count': '123'},
    {'name': 'Ø²Ø¨Ø¯Ø©', 'icon': Icons.cake, 'color': Colors.white, 'count': '98'},
    {'name': 'ÙØ±Ø¬Ø±ÙÙ', 'icon': Icons.opacity, 'color': Colors.amber, 'count': '87'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ²ÙÙØª ÙØ§ÙØ¯ÙÙÙ'),
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
                  Text('${cat['count']} ÙØªØ±', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}