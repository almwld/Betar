import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class BabyKidsScreen extends StatelessWidget {
  const BabyKidsScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙÙØ§Ø¨Ø³ Ø£Ø·ÙØ§Ù', 'icon': Icons.child_care, 'color': Colors.blue, 'count': '567'},
    {'name': 'Ø­ÙØ§Ø¶Ø§Øª', 'icon': Icons.inventory, 'color': Colors.green, 'count': '234'},
    {'name': 'Ø£ÙØ¹Ø§Ø¨ Ø£Ø·ÙØ§Ù', 'icon': Icons.toys, 'color': Colors.red, 'count': '345'},
    {'name': 'Ø¹Ø±Ø¨Ø§Øª Ø£Ø·ÙØ§Ù', 'icon': Icons.airline_seat_recline_normal, 'color': Colors.orange, 'count': '89'},
    {'name': 'ÙÙØ§Ø¹Ø¯ Ø³ÙØ§Ø±Ø©', 'icon': Icons.car_rental, 'color': Colors.purple, 'count': '67'},
    {'name': 'ÙØ³ØªÙØ²ÙØ§Øª Ø±Ø¶Ø§Ø¹Ø©', 'icon': Icons.emoji_food_beverage, 'color': Colors.pink, 'count': '156'},
    {'name': 'Ø£Ø«Ø§Ø« Ø£Ø·ÙØ§Ù', 'icon': Icons.bed, 'color': Colors.brown, 'count': '78'},
    {'name': 'ÙØ¯Ø§ÙØ§ ÙÙØ§ÙÙØ¯', 'icon': Icons.card_giftcard, 'color': Colors.teal, 'count': '45'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'ÙØ³ØªÙØ²ÙØ§Øª Ø§ÙØ£Ø·ÙØ§Ù'),
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