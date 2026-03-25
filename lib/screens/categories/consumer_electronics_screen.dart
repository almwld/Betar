import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class ConsumerElectronicsScreen extends StatelessWidget {
  const ConsumerElectronicsScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ØªÙÙØ²ÙÙÙØ§Øª', 'icon': Icons.tv, 'color': Colors.blue, 'count': '345'},
    {'name': 'ÙØ´ØºÙØ§Øª ØµÙØª', 'icon': Icons.speaker, 'color': Colors.green, 'count': '234'},
    {'name': 'ÙØ³Ø¬ÙØ§Øª', 'icon': Icons.video_library, 'color': Colors.red, 'count': '123'},
    {'name': 'Ø±ÙØ³ÙÙØ±Ø§Øª', 'icon': Icons.satellite_alt, 'color': Colors.orange, 'count': '89'},
    {'name': 'Ø¨Ø·Ø§Ø±ÙØ§Øª', 'icon': Icons.battery_std, 'color': Colors.yellow, 'count': '67'},
    {'name': 'Ø´ÙØ§Ø­Ù', 'icon': Icons.battery_charging_full, 'color': Colors.purple, 'count': '156'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ§Øª Ø§ÙØ§Ø³ØªÙÙØ§ÙÙØ©'),
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