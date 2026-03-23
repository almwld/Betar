import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'ØªÙØ§ØµÙ ÙØ¹ÙØ§'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Ø§ÙØ§Ø³Ù', filled: true, fillColor: AppTheme.getCardColor(context), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ', filled: true, fillColor: AppTheme.getCardColor(context), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 16),
            TextField(maxLines: 4, decoration: InputDecoration(labelText: 'Ø§ÙØ±Ø³Ø§ÙØ©', filled: true, fillColor: AppTheme.getCardColor(context), border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 24),
            CustomButton(text: 'Ø¥Ø±Ø³Ø§Ù', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}