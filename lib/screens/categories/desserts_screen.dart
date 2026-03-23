import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class DessertsScreen extends StatelessWidget {
  const DessertsScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø´ÙÙÙÙØ§ØªØ©', 'icon': Icons.cake, 'color': Colors.brown, 'count': '345'},
    {'name': 'ÙÙÙ', 'icon': Icons.cake, 'color': Colors.pink, 'count': '234'},
    {'name': 'Ø¬Ø§ØªÙÙ', 'icon': Icons.cake, 'color': Colors.purple, 'count': '156'},
    {'name': 'Ø¢ÙØ³ ÙØ±ÙÙ', 'icon': Icons.icecream, 'color': Colors.blue, 'count': '123'},
    {'name': 'ÙÙÙØ¨ÙØ©', 'icon': Icons.face, 'color': Colors.white, 'count': '98'},
    {'name': 'Ø£Ù Ø¹ÙÙ', 'icon': Icons.breakfast_dining, 'color': Colors.amber, 'count': '87'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ­ÙÙÙØ§Øª'),
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