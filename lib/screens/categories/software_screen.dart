import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SoftwareScreen extends StatelessWidget {
  const SoftwareScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ØªØ·Ø¨ÙÙØ§Øª', 'icon': Icons.apps, 'color': Colors.blue, 'count': '567'},
    {'name': 'Ø¨Ø±Ø§ÙØ¬ ÙÙØ¨ÙÙØªØ±', 'icon': Icons.computer, 'color': Colors.green, 'count': '345'},
    {'name': 'Ø£ÙØ¹Ø§Ø¨ Ø¥ÙÙØªØ±ÙÙÙØ©', 'icon': Icons.videogame_asset, 'color': Colors.purple, 'count': '234'},
    {'name': 'Ø£ÙØ¸ÙØ© ØªØ´ØºÙÙ', 'icon': Icons.settings, 'color': Colors.orange, 'count': '123'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ¨Ø±ÙØ¬ÙØ§Øª'),
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