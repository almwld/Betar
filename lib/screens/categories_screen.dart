import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Ø¥ÙÙØªØ±ÙÙÙØ§Øª', 'icon': Icons.devices},
    {'name': 'Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.directions_car},
    {'name': 'Ø¹ÙØ§Ø±Ø§Øª', 'icon': Icons.home},
    {'name': 'Ø£Ø«Ø§Ø«', 'icon': Icons.chair},
    {'name': 'ÙÙØ§Ø¨Ø³', 'icon': Icons.checkroom},
    {'name': 'Ø£Ø·Ø¹ÙØ©', 'icon': Icons.restaurant},
    {'name': 'Ø±ÙØ§Ø¶Ø©', 'icon': Icons.sports},
    {'name': 'ÙØªØ¨', 'icon': Icons.book},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø§ÙÙØ¦Ø§Øª'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2),
        itemCount: categories.length,
        itemBuilder: (context, index) => Card(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/all_ads'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(categories[index]['icon'], size: 48, color: AppTheme.goldColor),
                const SizedBox(height: 12),
                Text(categories[index]['name'], style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}