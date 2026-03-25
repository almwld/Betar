import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class SportsFitnessScreen extends StatelessWidget {
  const SportsFitnessScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø£Ø¯ÙØ§Øª Ø±ÙØ§Ø¶ÙØ©', 'icon': Icons.sports, 'color': Colors.blue, 'count': '345'},
    {'name': 'ÙÙØ§Ø¨Ø³ Ø±ÙØ§Ø¶ÙØ©', 'icon': Icons.sports_handball, 'color': Colors.green, 'count': '234'},
    {'name': 'Ø£Ø­Ø°ÙØ© Ø±ÙØ§Ø¶ÙØ©', 'icon': Icons.sports_soccer, 'color': Colors.red, 'count': '156'},
    {'name': 'ÙÙÙÙØ§Øª ØºØ°Ø§Ø¦ÙØ©', 'icon': Icons.fitness_center, 'color': Colors.orange, 'count': '89'},
    {'name': 'Ø£Ø¬ÙØ²Ø© ÙÙØ§ÙØ©', 'icon': Icons.fitness_center, 'color': Colors.purple, 'count': '67'},
    {'name': 'ÙÙØºØ§', 'icon': Icons.self_improvement, 'color': Colors.teal, 'count': '45'},
    {'name': 'ØªØ®Ø³ÙØ³', 'icon': Icons.monitor_weight, 'color': Colors.brown, 'count': '34'},
    {'name': 'Ø£ÙØ¯ÙØ© Ø±ÙØ§Ø¶ÙØ©', 'icon': Icons.sports_soccer, 'color': Colors.amber, 'count': '23'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ±ÙØ§Ø¶Ø© ÙØ§ÙÙÙØ§ÙØ©'),
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