import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class GraduationPartiesScreen extends StatelessWidget {
  const GraduationPartiesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ÙØ¯Ø§ÙØ§ ØªØ®Ø±Ø¬', 'icon': Icons.card_giftcard, 'color': Colors.blue, 'count': '234'},
    {'name': 'Ø¯Ø±ÙØ¹ ØªØ°ÙØ§Ø±ÙØ©', 'icon': Icons.emoji_events, 'color': Colors.amber, 'count': '156'},
    {'name': 'Ø¨ÙÙØ³Ø§Øª ÙØ±Ø¯', 'icon': Icons.local_florist, 'color': Colors.red, 'count': '123'},
    {'name': 'ØªÙØ²ÙØ¹Ø§Øª', 'icon': Icons.card_giftcard, 'color': Colors.pink, 'count': '98'},
    {'name': 'Ø¨Ø§ÙÙÙØ§Øª', 'icon': Icons.circle, 'color': Colors.purple, 'count': '87'},
    {'name': 'Ø¯ÙÙÙØ± Ø­ÙÙØ§Øª', 'icon': Icons.category, 'color': Colors.orange, 'count': '76'},
    {'name': 'ØªØµÙÙØ±', 'icon': Icons.camera_alt, 'color': Colors.blue, 'count': '65'},
    {'name': 'ÙÙØ´Ø© ØªØµÙÙØ±', 'icon': Icons.photo_camera, 'color': Colors.pink, 'count': '54'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø­ÙÙØ§Øª ÙØªØ®Ø±Ø¬'),
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