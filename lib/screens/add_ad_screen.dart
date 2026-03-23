import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class AddAdScreen extends StatelessWidget {
  const AddAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø¥Ø¶Ø§ÙØ© Ø¥Ø¹ÙØ§Ù'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(color: AppTheme.goldColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.goldColor)),
              child: const Center(child: Icon(Icons.add_photo_alternate, size: 50, color: AppTheme.goldColor)),
            ),
            const SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Ø¹ÙÙØ§Ù Ø§ÙØ¥Ø¹ÙØ§Ù', filled: true, fillColor: AppTheme.getCardColor(context), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Ø§ÙØ³Ø¹Ø±', filled: true, fillColor: AppTheme.getCardColor(context), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 16),
            TextField(maxLines: 4, decoration: InputDecoration(labelText: 'Ø§ÙÙØµÙ', filled: true, fillColor: AppTheme.getCardColor(context), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 24),
            CustomButton(text: 'ÙØ´Ø± Ø§ÙØ¥Ø¹ÙØ§Ù', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}