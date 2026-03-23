import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class TrainingServicesScreen extends StatelessWidget {
  const TrainingServicesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø¯ÙØ±Ø§Øª ÙØºØ©', 'icon': Icons.language, 'color': Colors.blue, 'count': '123'},
    {'name': 'Ø¯ÙØ±Ø§Øª Ø¨Ø±ÙØ¬Ø©', 'icon': Icons.computer, 'color': Colors.green, 'count': '89'},
    {'name': 'ØªØ¯Ø±ÙØ¨ ÙÙÙÙ', 'icon': Icons.build, 'color': Colors.orange, 'count': '67'},
    {'name': 'ØªØ­ÙÙØ¸ ÙØ±Ø¢Ù', 'icon': Icons.mosque, 'color': Colors.green, 'count': '45'},
    {'name': 'Ø¯ÙØ±Ø§Øª Ø¥Ø¯Ø§Ø±ÙØ©', 'icon': Icons.business, 'color': Colors.purple, 'count': '34'},
    {'name': 'ØªØ·ÙÙØ± Ø°Ø§ØªÙ', 'icon': Icons.self_improvement, 'color': Colors.teal, 'count': '56'},
    {'name': 'Ø¯ÙØ±Ø§Øª Ø£ÙÙÙØ§ÙÙ', 'icon': Icons.laptop, 'color': Colors.red, 'count': '78'},
    {'name': 'Ø´ÙØ§Ø¯Ø§Øª ÙÙÙÙØ©', 'icon': Icons.card_membership, 'color': Colors.amber, 'count': '23'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø®Ø¯ÙØ§Øª Ø§ÙØªØ¹ÙÙÙ ÙØ§ÙØªØ¯Ø±ÙØ¨'),
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
                  Text('${cat['count']} Ø¯ÙØ±Ø©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}