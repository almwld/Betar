import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final _amountController = TextEditingController();
  final _recipientController = TextEditingController();
  String _selectedCurrency = 'YER';
  bool _isLoading = false;

  Future<void> _transfer() async {
    if (_amountController.text.isEmpty || _recipientController.text.isEmpty) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ØªÙ Ø§ÙØªØ­ÙÙÙ Ø¨ÙØ¬Ø§Ø­', style: TextStyle(fontFamily: 'Changa')), backgroundColor: AppTheme.success),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'ØªØ­ÙÙÙ'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(gradient: AppTheme.goldGradient, borderRadius: BorderRadius.circular(20)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ø§ÙØ±ØµÙØ¯ Ø§ÙØ­Ø§ÙÙ', style: TextStyle(fontFamily: 'Changa', fontSize: 14, color: AppTheme.darkText)),
                  SizedBox(height: 8),
                  Text('125,000 Ø±.Ù', style: TextStyle(fontFamily: 'Changa', fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('Ø±ÙÙ Ø§ÙÙØ³ØªÙÙ', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 12),
            TextField(
              controller: _recipientController,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.right,
              style: const TextStyle(fontFamily: 'Changa'),
              decoration: InputDecoration(
                hintText: 'Ø£Ø¯Ø®Ù Ø±ÙÙ Ø§ÙÙØ§ØªÙ Ø£Ù Ø±ÙÙ Ø§ÙØ­Ø³Ø§Ø¨',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                prefixIcon: const Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 24),
            Text('Ø§ÙÙØ¨ÙØº', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 12),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              style: const TextStyle(fontFamily: 'Changa'),
              decoration: InputDecoration(
                hintText: 'Ø£Ø¯Ø®Ù Ø§ÙÙØ¨ÙØº',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 32),
            CustomButton(text: 'ØªØ­ÙÙÙ', onPressed: _transfer, isLoading: _isLoading),
          ],
        ),
      ),
    );
  }
}