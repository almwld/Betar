import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class MedicalEquipmentScreen extends StatelessWidget {
  const MedicalEquipmentScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø£Ø¬ÙØ²Ø© ÙÙØ§Ø³ Ø¶ØºØ·', 'icon': Icons.monitor_heart, 'color': Colors.red, 'count': '234'},
    {'name': 'Ø³ÙØ§Ø¹Ø§Øª Ø·Ø¨ÙØ©', 'icon': Icons.headphones, 'color': Colors.blue, 'count': '156'},
    {'name': 'ÙÙØ§Ø¹Ø¯ ÙØªØ­Ø±ÙØ©', 'icon': Icons.wheelchair_pickup, 'color': Colors.grey, 'count': '89'},
    {'name': 'Ø£Ø³Ø±Ø© Ø·Ø¨ÙØ©', 'icon': Icons.bed, 'color': Colors.cyan, 'count': '67'},
    {'name': 'Ø£Ø¬ÙØ²Ø© ØªÙÙØ³', 'icon': Icons.air, 'color': Colors.green, 'count': '45'},
    {'name': 'ÙØ­Ø§ÙÙÙ Ø·Ø¨ÙØ©', 'icon': Icons.medical_services, 'color': Colors.purple, 'count': '123'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙØ¹Ø¯Ø§Øª Ø§ÙØ·Ø¨ÙØ©'),
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