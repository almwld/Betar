import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø³ÙØ§Ø³Ø© Ø§ÙØ®ØµÙØµÙØ©'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ø³ÙØ§Ø³Ø© Ø§ÙØ®ØµÙØµÙØ©', style: TextStyle(fontFamily: 'Changa', fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 16),
            Text('ÙØ­Ù ÙØ­ØªØ±Ù Ø®ØµÙØµÙØªÙ ÙÙÙØªØ²Ù Ø¨Ø­ÙØ§ÙØ© Ø¨ÙØ§ÙØ§ØªÙ Ø§ÙØ´Ø®ØµÙØ©.', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
            const SizedBox(height: 16),
            Text('1. Ø¬ÙØ¹ Ø§ÙÙØ¹ÙÙÙØ§Øª', style: TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 8),
            Text('ÙÙÙÙ Ø¨Ø¬ÙØ¹ Ø§ÙÙØ¹ÙÙÙØ§Øª Ø§ÙÙØ§Ø²ÙØ© ÙÙØ· ÙØªÙØ¯ÙÙ Ø®Ø¯ÙØ§ØªÙØ§ Ø¨Ø´ÙÙ Ø£ÙØ¶Ù.', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getSecondaryTextColor(context))),
            const SizedBox(height: 16),
            Text('2. Ø§Ø³ØªØ®Ø¯Ø§Ù Ø§ÙÙØ¹ÙÙÙØ§Øª', style: TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 8),
            Text('ÙØ³ØªØ®Ø¯Ù ÙØ¹ÙÙÙØ§ØªÙ ÙÙØ· ÙØ£ØºØ±Ø§Ø¶ ØªÙØ¯ÙÙ Ø§ÙØ®Ø¯ÙØ© ÙØªØ­Ø³ÙÙ ØªØ¬Ø±Ø¨ØªÙ.', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getSecondaryTextColor(context))),
            const SizedBox(height: 16),
            Text('3. Ø­ÙØ§ÙØ© Ø§ÙÙØ¹ÙÙÙØ§Øª', style: TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 8),
            Text('ÙØ³ØªØ®Ø¯Ù ØªÙÙÙØ§Øª Ø£ÙØ§Ù ÙØªÙØ¯ÙØ© ÙØ­ÙØ§ÙØ© Ø¨ÙØ§ÙØ§ØªÙ.', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getSecondaryTextColor(context))),
          ],
        ),
      ),
    );
  }
}