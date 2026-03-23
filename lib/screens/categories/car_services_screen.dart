import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class CarServicesScreen extends StatelessWidget {
  const CarServicesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'ØºØ³ÙÙ Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.local_car_wash, 'color': Colors.blue, 'count': '234'},
    {'name': 'ØªØºÙÙØ± Ø²ÙØª', 'icon': Icons.oil_barrel, 'color': Colors.brown, 'count': '156'},
    {'name': 'ØªØµÙÙØ­ ÙÙÙØ§ÙÙÙØ§', 'icon': Icons.build, 'color': Colors.grey, 'count': '189'},
    {'name': 'ÙÙØ±Ø¨Ø§Ø¡ Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.electrical_services, 'color': Colors.yellow, 'count': '123'},
    {'name': 'Ø³ÙÙØ±Ø©', 'icon': Icons.car_repair, 'color': Colors.orange, 'count': '98'},
    {'name': 'Ø¯ÙØ§Ù Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.brush, 'color': Colors.red, 'count': '87'},
    {'name': 'ØªØ¨Ø±ÙØ¯ ÙØªØ¯ÙØ¦Ø©', 'icon': Icons.ac_unit, 'color': Colors.cyan, 'count': '76'},
    {'name': 'Ø§Ø·Ø§Ø±Ø§Øª', 'icon': Icons.tire_repair, 'color': Colors.black, 'count': '145'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø®Ø¯ÙØ§Øª Ø§ÙØ³ÙØ§Ø±Ø§Øª'),
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
                  Text('${cat['count']} ÙØ±ÙØ² Ø®Ø¯ÙØ©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}