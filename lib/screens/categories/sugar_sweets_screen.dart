import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SugarSweetsScreen extends StatelessWidget {
  const SugarSweetsScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø³ÙØ± Ø£Ø¨ÙØ¶', 'icon': Icons.cake, 'color': Colors.white, 'count': '345'},
    {'name': 'Ø³ÙØ± Ø¨ÙÙ', 'icon': Icons.cake, 'color': Colors.brown, 'count': '234'},
    {'name': 'Ø¹Ø³Ù', 'icon': Icons.water_drop, 'color': Colors.amber, 'count': '189'},
    {'name': 'ÙØ±Ø¨Ù', 'icon': Icons.breakfast_dining, 'color': Colors.red, 'count': '156'},
    {'name': 'Ø´ÙÙÙÙØ§ØªØ©', 'icon': Icons.cake, 'color': Colors.brown, 'count': '123'},
    {'name': 'Ø­ÙØ§ÙØ© Ø·Ø­ÙÙÙØ©', 'icon': Icons.cake, 'color': Colors.brown, 'count': '98'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ³ÙØ± ÙØ§ÙØ­ÙÙÙØ§Øª'),
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