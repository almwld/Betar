import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class HomeAppliancesScreen extends StatelessWidget {
  const HomeAppliancesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø«ÙØ§Ø¬Ø§Øª', 'icon': Icons.kitchen, 'color': Colors.cyan, 'count': '456'},
    {'name': 'ØºØ³Ø§ÙØ§Øª', 'icon': Icons.local_laundry_service, 'color': Colors.blue, 'count': '389'},
    {'name': 'ÙÙÙÙØ§Øª', 'icon': Icons.ac_unit, 'color': Colors.lightBlue, 'count': '678'},
    {'name': 'Ø£ÙØ±Ø§Ù', 'icon': Icons.kitchen, 'color': Colors.orange, 'count': '234'},
    {'name': 'ÙÙØ§ÙØ³', 'icon': Icons.cleaning_services, 'color': Colors.purple, 'count': '167'},
    {'name': 'ÙØ±Ø§ÙØ­', 'icon': Icons.toys, 'color': Colors.green, 'count': '145'},
    {'name': 'Ø³Ø®Ø§ÙØ§Øª', 'icon': Icons.water, 'color': Colors.red, 'count': '123'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ£Ø¬ÙØ²Ø© Ø§ÙÙÙØ²ÙÙØ©'),
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