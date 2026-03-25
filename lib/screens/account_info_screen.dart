import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class AccountInfoScreen extends StatelessWidget {
  const AccountInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'ÙØ¹ÙÙÙØ§Øª Ø§ÙØ­Ø³Ø§Ø¨'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: AppTheme.goldColor,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: const Text('ØªØºÙÙØ± Ø§ÙØµÙØ±Ø©', style: TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ø§ÙØ§Ø³Ù Ø§ÙÙØ§ÙÙ',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ø±ÙÙ Ø§ÙÙØ§ØªÙ',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Ø§ÙØ¹ÙÙØ§Ù',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(text: 'Ø­ÙØ¸ Ø§ÙØªØºÙÙØ±Ø§Øª', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}