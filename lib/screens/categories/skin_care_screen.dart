import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SkinCareScreen extends StatelessWidget {
  const SkinCareScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙØ±ÙÙØ§Øª ØªØ±Ø·ÙØ¨', 'icon': Icons.face, 'color': Colors.pink, 'count': '234'},
    {'name': 'ØªÙÙØ±', 'icon': Icons.water_drop, 'color': Colors.blue, 'count': '156'},
    {'name': 'ÙÙØ´Ø±', 'icon': Icons.cleaning_services, 'color': Colors.orange, 'count': '123'},
    {'name': 'ÙØ§ÙÙ Ø´ÙØ³', 'icon': Icons.wb_sunny, 'color': Colors.yellow, 'count': '98'},
    {'name': 'ÙØ§Ø³ÙØ§Øª', 'icon': Icons.face, 'color': Colors.green, 'count': '87'},
    {'name': 'Ø³ÙØ±ÙÙ', 'icon': Icons.opacity, 'color': Colors.purple, 'count': '76'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ¹ÙØ§ÙØ© Ø¨Ø§ÙØ¨Ø´Ø±Ø©'),
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