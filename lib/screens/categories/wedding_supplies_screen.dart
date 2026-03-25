import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class WeddingSuppliesScreen extends StatelessWidget {
  const WeddingSuppliesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙØ³Ø§ØªÙÙ Ø£Ø¹Ø±Ø§Ø³', 'icon': Icons.favorite, 'color': Colors.white, 'count': '234'},
    {'name': 'Ø¨Ø¯Ù Ø¹Ø±ÙØ³', 'icon': Icons.man, 'color': Colors.black, 'count': '156'},
    {'name': 'Ø°ÙØ¨ ÙÙØ¬ÙÙØ±Ø§Øª', 'icon': Icons.diamond, 'color': Colors.amber, 'count': '89'},
    {'name': 'Ø¯ÙÙÙØ± Ø£Ø¹Ø±Ø§Ø³', 'icon': Icons.category, 'color': Colors.pink, 'count': '123'},
    {'name': 'ÙØ±ÙØ¯', 'icon': Icons.local_florist, 'color': Colors.red, 'count': '98'},
    {'name': 'ÙÙØ´Ø©', 'icon': Icons.chair, 'color': Colors.purple, 'count': '67'},
    {'name': 'Ø³ÙØ§Ø±Ø§Øª ÙØ§Ø®Ø±Ø©', 'icon': Icons.directions_car, 'color': Colors.amber, 'count': '45'},
    {'name': 'ØªØµÙÙØ±', 'icon': Icons.camera_alt, 'color': Colors.blue, 'count': '78'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'ØªØ¬ÙÙØ²Ø§Øª Ø§ÙØ£Ø¹Ø±Ø§Ø³'),
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
                  Text('${cat['count']} Ø®Ø¯ÙØ©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}