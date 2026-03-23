import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class PerfumesScreen extends StatelessWidget {
  const PerfumesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø¹Ø·ÙØ± Ø±Ø¬Ø§ÙÙØ©', 'icon': Icons.emoji_people, 'color': Colors.blue, 'count': '345'},
    {'name': 'Ø¹Ø·ÙØ± ÙØ³Ø§Ø¦ÙØ©', 'icon': Icons.emoji_emotions, 'color': Colors.pink, 'count': '456'},
    {'name': 'Ø¹Ø·ÙØ± Ø¹Ø±Ø¨ÙØ©', 'icon': Icons.spa, 'color': Colors.amber, 'count': '234'},
    {'name': 'Ø¹Ø·ÙØ± ÙØ±ÙØ³ÙØ©', 'icon': Icons.public, 'color': Colors.purple, 'count': '156'},
    {'name': 'Ø¨Ø®ÙØ±', 'icon': Icons. smoke_free, 'color': Colors.brown, 'count': '123'},
    {'name': 'Ø¯ÙÙ Ø¹ÙØ¯', 'icon': Icons.water_drop, 'color': Colors.grey, 'count': '98'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ¹Ø·ÙØ±'),
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
                  Text('${cat['count']} Ø¹Ø·Ø±', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}