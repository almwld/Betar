import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class SubcategoriesScreen extends StatelessWidget {
  final String categoryName;
  const SubcategoriesScreen({super.key, required this.categoryName});

  final List<Map<String, dynamic>> _electronicsSub = const [
    {'name': 'ÙÙØ§ØªÙ', 'icon': Icons.phone_android, 'count': 1234},
    {'name': 'ÙØ§Ø¨ØªÙØ¨', 'icon': Icons.laptop, 'count': 567},
    {'name': 'ØªØ§Ø¨ÙØª', 'icon': Icons.tablet, 'count': 345},
    {'name': 'Ø³Ø§Ø¹Ø§Øª Ø°ÙÙØ©', 'icon': Icons.watch, 'count': 234},
    {'name': 'ÙØ§ÙÙØ±Ø§Øª', 'icon': Icons.camera_alt, 'count': 456},
    {'name': 'Ø³ÙØ§Ø¹Ø§Øª', 'icon': Icons.headphones, 'count': 789},
  ];

  List<Map<String, dynamic>> get _subcategories {
    if (categoryName.contains('Ø¥ÙÙØªØ±ÙÙÙØ§Øª')) return _electronicsSub;
    return _electronicsSub; // fallback
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(title: categoryName),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _subcategories.length,
        itemBuilder: (ctx, i) {
          final sub = _subcategories[i];
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppTheme.goldColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(sub['icon'] as IconData, color: AppTheme.goldColor, size: 30),
                  ),
                  const SizedBox(height: 8),
                  Text(sub['name'], style: const TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('${sub['count']} ÙÙØªØ¬', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}