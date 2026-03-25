import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class CommercialRealestateScreen extends StatelessWidget {
  const CommercialRealestateScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙØ­ÙØ§Øª ØªØ¬Ø§Ø±ÙØ©', 'icon': Icons.store, 'color': Colors.blue, 'count': '234'},
    {'name': 'ÙÙØ§ØªØ¨', 'icon': Icons.business, 'color': Colors.green, 'count': '156'},
    {'name': 'ÙØ³ØªÙØ¯Ø¹Ø§Øª', 'icon': Icons.warehouse, 'color': Colors.orange, 'count': '89'},
    {'name': 'ÙØ¹Ø§Ø±Ø¶', 'icon': Icons.storefront, 'color': Colors.purple, 'count': '67'},
    {'name': 'ÙØµØ§ÙØ¹', 'icon': Icons.factory, 'color': Colors.red, 'count': '45'},
    {'name': 'ÙØ·Ø§Ø¹Ù', 'icon': Icons.restaurant, 'color': Colors.amber, 'count': '78'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ¹ÙØ§Ø±Ø§Øª Ø§ÙØªØ¬Ø§Ø±ÙØ©'),
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
                  Text('${cat['count']} Ø¹ÙØ§Ø±', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}