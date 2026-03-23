import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class ReportAdScreen extends StatefulWidget {
  const ReportAdScreen({super.key});

  @override
  State<ReportAdScreen> createState() => _ReportAdScreenState();
}

class _ReportAdScreenState extends State<ReportAdScreen> {
  String? _selectedReason;
  final _detailsController = TextEditingController();

  final List<String> _reasons = ['Ø¥Ø¹ÙØ§Ù ÙØ¶ÙÙ', 'ÙÙØªØ¬ ØºÙØ± ÙØªÙÙØ±', 'Ø³Ø¹Ø± ØºÙØ± ØµØ­ÙØ­', 'ØµÙØ± ÙØ²ÙÙØ©', 'Ø³Ø¨Ø§Ù', 'Ø£Ø®Ø±Ù'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø§ÙØ¥Ø¨ÙØ§Øº Ø¹Ù Ø¥Ø¹ÙØ§Ù'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ø³Ø¨Ø¨ Ø§ÙØ¥Ø¨ÙØ§Øº:', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: _reasons.map((reason) => ChoiceChip(
                label: Text(reason, style: const TextStyle(fontFamily: 'Changa')),
                selected: _selectedReason == reason,
                selectedColor: AppTheme.goldColor,
                onSelected: (selected) => setState(() => _selectedReason = reason),
              )).toList(),
            ),
            const SizedBox(height: 24),
            Text('ØªÙØ§ØµÙÙ Ø¥Ø¶Ø§ÙÙØ©:', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 12),
            TextField(
              controller: _detailsController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Ø§Ø´Ø±Ø­ Ø§ÙÙØ´ÙÙØ© Ø¨Ø§ÙØªÙØµÙÙ...',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(text: 'Ø¥Ø±Ø³Ø§Ù Ø§ÙØ¨ÙØ§Øº', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}