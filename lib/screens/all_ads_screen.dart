import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/ad_card.dart';

class AllAdsScreen extends StatelessWidget {
  const AllAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'Ø¬ÙÙØ¹ Ø§ÙØ¥Ø¹ÙØ§ÙØ§Øª'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 12, mainAxisSpacing: 12),
        itemCount: 10,
        itemBuilder: (context, index) => AdCard(
          product: _getDummyProduct(index),
          onTap: () => Navigator.pushNamed(context, '/ad_detail'),
        ),
      ),
    );
  }

  _getDummyProduct(int index) {
    return null; // Ø³ÙØªÙ Ø§Ø³ØªØ¨Ø¯Ø§ÙÙ Ø¨Ø§ÙÙÙÙØ°Ø¬ Ø§ÙØ­ÙÙÙÙ
  }
}