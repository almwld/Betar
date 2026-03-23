import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class HomeServicesScreen extends StatelessWidget {
  const HomeServicesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ØªÙØ¸ÙÙ ÙÙØ§Ø²Ù', 'icon': Icons.cleaning_services, 'color': Colors.blue, 'count': '234'},
    {'name': 'ØµÙØ§ÙØ© ÙÙÙÙØ§Øª', 'icon': Icons.ac_unit, 'color': Colors.cyan, 'count': '156'},
    {'name': 'Ø³Ø¨Ø§ÙØ©', 'icon': Icons.plumbing, 'color': Colors.green, 'count': '189'},
    {'name': 'ÙÙØ±Ø¨Ø§Ø¡', 'icon': Icons.electrical_services, 'color': Colors.yellow, 'count': '167'},
    {'name': 'ÙØ¬Ø§Ø±Ø©', 'icon': Icons.handyman, 'color': Colors.orange, 'count': '98'},
    {'name': 'Ø¯ÙØ§Ù', 'icon': Icons.brush, 'color': Colors.purple, 'count': '87'},
    {'name': 'ØªØ¨ÙÙØ·', 'icon': Icons.grid_on, 'color': Colors.brown, 'count': '76'},
    {'name': 'Ø¹Ø²Ù', 'icon': Icons.water, 'color': Colors.grey, 'count': '45'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ®Ø¯ÙØ§Øª Ø§ÙÙÙØ²ÙÙØ©'),
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
                  Text('${cat['count']} ÙÙØ¯Ù Ø®Ø¯ÙØ©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}