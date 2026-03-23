import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'products_screen.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> subcategories;
  
  const CategoryDetailScreen({
    super.key,
    required this.categoryName,
    required this.subcategories,
  });

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
        itemCount: subcategories.length,
        itemBuilder: (ctx, i) {
          final sub = subcategories[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductsScreen(
                    category: sub['name'],
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
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
                    child: Icon(sub['icon'], color: AppTheme.goldColor, size: 30),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    sub['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${sub['count']} ÙÙØªØ¬',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}