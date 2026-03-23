import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {'question': 'ÙÙÙ Ø£ÙÙÙ Ø¨Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨Ø', 'answer': 'ÙÙÙÙÙ Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨ ÙÙ Ø®ÙØ§Ù Ø§ÙØ¶ØºØ· Ø¹ÙÙ Ø²Ø± Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨ ÙÙÙØ¡ Ø§ÙØ¨ÙØ§ÙØ§Øª Ø§ÙÙØ·ÙÙØ¨Ø©.'},
    {'question': 'ÙÙÙ Ø£Ø¶ÙÙ Ø¥Ø¹ÙØ§ÙØ', 'answer': 'Ø§Ø¶ØºØ· Ø¹ÙÙ Ø²Ø± + ÙÙ Ø§ÙØ´Ø±ÙØ· Ø§ÙØ³ÙÙÙ ÙØ§ÙÙØ£ ØªÙØ§ØµÙÙ Ø§ÙØ¥Ø¹ÙØ§Ù.'},
    {'question': 'ÙÙÙ Ø£Ø¯ÙØ¹Ø', 'answer': 'ÙÙÙÙÙ Ø§ÙØ¯ÙØ¹ ÙÙ Ø®ÙØ§Ù Ø§ÙÙØ­ÙØ¸Ø© Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ© Ø£Ù Ø§ÙØªØ­ÙÙÙ Ø§ÙØ¨ÙÙÙ.'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø§ÙØ£Ø³Ø¦ÙØ© Ø§ÙØ´Ø§Ø¦Ø¹Ø©'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            title: Text(faqs[index]['question']!, style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
            children: [Padding(padding: const EdgeInsets.all(16), child: Text(faqs[index]['answer']!, style: TextStyle(fontFamily: 'Changa', color: AppTheme.getSecondaryTextColor(context))))],
          ),
        ),
      ),
    );
  }
}