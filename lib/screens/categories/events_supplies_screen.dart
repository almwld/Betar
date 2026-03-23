import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class EventsSuppliesScreen extends StatelessWidget {
  const EventsSuppliesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø®ÙØ§Ù', 'icon': Icons.holiday_village, 'color': Colors.green, 'count': '123'},
    {'name': 'ÙØ±Ø§Ø³Ù', 'icon': Icons.chair, 'color': Colors.brown, 'count': '234'},
    {'name': 'Ø·Ø§ÙÙØ§Øª', 'icon': Icons.table_restaurant, 'color': Colors.brown, 'count': '189'},
    {'name': 'ÙØ¹Ø¯Ø§Øª ØµÙØª', 'icon': Icons.speaker, 'color': Colors.black, 'count': '156'},
    {'name': 'Ø¥Ø¶Ø§Ø¡Ø©', 'icon': Icons.light, 'color': Colors.yellow, 'count': '98'},
    {'name': 'ÙÙÙÙØ§Øª', 'icon': Icons.ac_unit, 'color': Colors.blue, 'count': '87'},
    {'name': 'ÙÙÙØ¯Ø§Øª', 'icon': Icons.electrical_services, 'color': Colors.orange, 'count': '76'},
    {'name': 'ÙØ·Ø§Ø¨Ø® ÙØªÙÙÙØ©', 'icon': Icons.kitchen, 'color': Colors.grey, 'count': '45'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'ØªØ¬ÙÙØ²Ø§Øª Ø§ÙØ­ÙÙØ§Øª'),
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