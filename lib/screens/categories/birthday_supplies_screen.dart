import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class BirthdaySuppliesScreen extends StatelessWidget {
  const BirthdaySuppliesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙÙÙ Ø£Ø¹ÙØ§Ø¯', 'icon': Icons.cake, 'color': Colors.pink, 'count': '345'},
    {'name': 'Ø´ÙÙØ¹', 'icon': Icons.emoji_objects, 'color': Colors.yellow, 'count': '234'},
    {'name': 'Ø¨Ø§ÙÙÙØ§Øª', 'icon': Icons.circle, 'color': Colors.purple, 'count': '189'},
    {'name': 'ÙØ¨Ø¹Ø§Øª', 'icon': Icons.emoji_events, 'color': Colors.red, 'count': '156'},
    {'name': 'ÙØ¯Ø§ÙØ§', 'icon': Icons.card_giftcard, 'color': Colors.blue, 'count': '123'},
    {'name': 'Ø¯ÙÙÙØ±', 'icon': Icons.category, 'color': Colors.orange, 'count': '98'},
    {'name': 'ÙÙØ±ÙØ¹Ø§Øª', 'icon': Icons.celebration, 'color': Colors.red, 'count': '87'},
    {'name': 'Ø£ÙØ¹Ø§Ø¨ Ø£Ø·ÙØ§Ù', 'icon': Icons.toys, 'color': Colors.green, 'count': '76'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø£Ø¹ÙØ§Ø¯ Ø§ÙÙÙÙØ§Ø¯'),
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
                  Text('${cat['count']} ÙØ·Ø¹Ø©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}