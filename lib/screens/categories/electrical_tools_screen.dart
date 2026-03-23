import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class ElectricalToolsScreen extends StatelessWidget {
  const ElectricalToolsScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø£Ø³ÙØ§Ù ÙÙØ±Ø¨Ø§Ø¡', 'icon': Icons.electrical_services, 'color': Colors.black, 'count': '234'},
    {'name': 'ÙÙØ§ØªÙØ­ ÙÙØ±Ø¨Ø§Ø¡', 'icon': Icons.toggle_on, 'color': Colors.grey, 'count': '156'},
    {'name': 'ÙÙØ¨Ø§Øª', 'icon': Icons.lightbulb, 'color': Colors.yellow, 'count': '345'},
    {'name': 'Ø£Ø¯ÙØ§Øª ÙÙØ§Ø³', 'icon': Icons.speed, 'color': Colors.blue, 'count': '89'},
    {'name': 'ÙÙØ­Ø§Øª ØªÙØ²ÙØ¹', 'icon': Icons.grid_3x3, 'color': Colors.orange, 'count': '67'},
    {'name': 'ÙØ­ÙÙØ§Øª', 'icon': Icons.transform, 'color': Colors.purple, 'count': '45'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ£Ø¯ÙØ§Øª Ø§ÙÙÙØ±Ø¨Ø§Ø¦ÙØ©'),
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