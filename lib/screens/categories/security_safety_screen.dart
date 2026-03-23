import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SecuritySafetyScreen extends StatelessWidget {
  const SecuritySafetyScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙØ§ÙÙØ±Ø§Øª ÙØ±Ø§ÙØ¨Ø©', 'icon': Icons.videocam, 'color': Colors.blue, 'count': '234'},
    {'name': 'Ø£ÙØ¸ÙØ© Ø¥ÙØ°Ø§Ø±', 'icon': Icons.warning, 'color': Colors.red, 'count': '145'},
    {'name': 'Ø£ÙÙØ§Ù Ø°ÙÙØ©', 'icon': Icons.lock, 'color': Colors.grey, 'count': '89'},
    {'name': 'Ø­Ø±Ø§Ø³ Ø£ÙÙ', 'icon': Icons.security, 'color': Colors.green, 'count': '56'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ£ÙÙ ÙØ§ÙØ³ÙØ§ÙØ©'),
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