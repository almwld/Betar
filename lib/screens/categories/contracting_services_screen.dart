import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class ContractingServicesScreen extends StatelessWidget {
  const ContractingServicesScreen({super.key});

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Ø¨ÙØ§Ø¡ ÙÙÙ', 'icon': Icons.villa, 'color': Colors.green, 'count': '89'},
    {'name': 'ØªØ´Ø·ÙØ¨Ø§Øª', 'icon': Icons.brush, 'color': Colors.orange, 'count': '156'},
    {'name': 'ÙØ¯Ù ÙØ¥Ø²Ø§ÙØ©', 'icon': Icons.do_not_disturb, 'color': Colors.red, 'count': '45'},
    {'name': 'Ø­ÙØ±ÙØ§Øª', 'icon': Icons.agriculture, 'color': Colors.brown, 'count': '67'},
    {'name': 'ØªØ³ÙÙÙ ÙØ¬Ø§Ø±Ù', 'icon': Icons.plumbing, 'color': Colors.grey, 'count': '34'},
    {'name': 'Ø¹Ø²Ù ÙØ§Ø¦Ù', 'icon': Icons.water, 'color': Colors.blue, 'count': '56'},
    {'name': 'ÙØ§Ø¬ÙØ§Øª Ø²Ø¬Ø§Ø¬', 'icon': Icons.window, 'color': Colors.cyan, 'count': '23'},
    {'name': 'Ø¯ÙØ§ÙØ§Øª', 'icon': Icons.brush, 'color': Colors.purple, 'count': '78'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø®Ø¯ÙØ§Øª Ø§ÙÙÙØ§ÙÙØ§Øª'),
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
                  Text('${cat['count']} Ø´Ø±ÙØ©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}