import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _amountController = TextEditingController();
  final _accountController = TextEditingController();
  String _selectedCurrency = 'YER';
  String _selectedMethod = 'ÙØ±ÙÙÙ';
  bool _isLoading = false;

  final List<String> _currencies = ['YER', 'SAR', 'USD'];
  final List<String> _methods = ['ÙØ±ÙÙÙ', 'Ø¨ÙÙÙ', 'ØªØ­ÙÙÙ', 'ÙÙØ¯Ù'];

  @override
  void dispose() {
    _amountController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  Future<void> _withdraw() async {
    if (_amountController.text.isEmpty || _accountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ÙØ±Ø¬Ù ÙÙØ¡ Ø¬ÙÙØ¹ Ø§ÙØ­ÙÙÙ', style: TextStyle(fontFamily: 'Changa')),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ØªÙ Ø¥Ø±Ø³Ø§Ù Ø·ÙØ¨ Ø§ÙØ³Ø­Ø¨ Ø¨ÙØ¬Ø§Ø­', style: TextStyle(fontFamily: 'Changa')),
          backgroundColor: AppTheme.success,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø³Ø­Ø¨'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppTheme.goldGradient,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Ø§ÙØ±ØµÙØ¯ Ø§ÙØ­Ø§ÙÙ', style: TextStyle(fontFamily: 'Changa', fontSize: 14, color: AppTheme.darkText)),
                  const SizedBox(height: 8),
                  const Text('125,000 Ø±.Ù', style: TextStyle(fontFamily: 'Changa', fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('Ø§ÙØ¹ÙÙØ©', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: _currencies.map((currency) {
                return ChoiceChip(
                  label: Text(currency, style: TextStyle(fontFamily: 'Changa', color: _selectedCurrency == currency ? AppTheme.darkText : AppTheme.getTextColor(context))),
                  selected: _selectedCurrency == currency,
                  selectedColor: AppTheme.goldColor,
                  onSelected: (selected) => setState(() => _selectedCurrency = currency),
                );
              }).toList(),
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
            const SizedBox(height: 24),
            Text('Ø±ÙÙ Ø§ÙØ­Ø³Ø§Ø¨/Ø§ÙØ¬ÙØ§Ù', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 12),
            TextField(
              controller: _accountController,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.right,
              style: const TextStyle(fontFamily: 'Changa'),
              decoration: InputDecoration(
                hintText: 'Ø£Ø¯Ø®Ù Ø±ÙÙ Ø§ÙØ­Ø³Ø§Ø¨ Ø£Ù Ø§ÙØ¬ÙØ§Ù',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            Text('Ø·Ø±ÙÙØ© Ø§ÙØ³Ø­Ø¨', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 12),
            ..._methods.map((method) => RadioListTile<String>(
              title: Text(method, style: const TextStyle(fontFamily: 'Changa')),
              value: method,
              groupValue: _selectedMethod,
              activeColor: AppTheme.goldColor,
              onChanged: (value) => setState(() => _selectedMethod = value!),
            )).toList(),
            const SizedBox(height: 32),
            CustomButton(text: 'Ø³Ø­Ø¨', onPressed: _withdraw, isLoading: _isLoading),
          ],
        ),
      ),
    );
  }
}