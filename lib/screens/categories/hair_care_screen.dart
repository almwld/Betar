import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class HairCareScreen extends StatelessWidget {
  const HairCareScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø´Ø§ÙØ¨Ù', 'icon': Icons.shower, 'color': Colors.blue, 'count': '234'},
    {'name': 'Ø¨ÙØ³Ù', 'icon': Icons.spa, 'color': Colors.green, 'count': '156'},
    {'name': 'Ø²ÙØª Ø´Ø¹Ø±', 'icon': Icons.opacity, 'color': Colors.amber, 'count': '123'},
    {'name': 'ÙØ±ÙÙ Ø´Ø¹Ø±', 'icon': Icons.face, 'color': Colors.pink, 'count': '98'},
    {'name': 'ØµØ¨ØºØ§Øª', 'icon': Icons.color_lens, 'color': Colors.purple, 'count': '87'},
    {'name': 'Ø£Ø¯ÙØ§Øª ØªØµÙÙÙ', 'icon': Icons.content_cut, 'color': Colors.grey, 'count': '76'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ¹ÙØ§ÙØ© Ø¨Ø§ÙØ´Ø¹Ø±'),
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