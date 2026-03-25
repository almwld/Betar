import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

/// Ø´Ø§Ø´Ø© Ø§ÙØ¥ÙØ¯Ø§Ø¹
class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  final _amountController = TextEditingController();
  String _selectedCurrency = 'YER';
  String _selectedMethod = 'ÙØ±ÙÙÙ';
  bool _isLoading = false;

  final List<String> _currencies = ['YER', 'SAR', 'USD'];
  final List<String> _methods = ['ÙØ±ÙÙÙ', 'Ø¨ÙÙÙ', 'ØªØ­ÙÙÙ', 'ÙÙØ¯Ø§ÙÙÙ ÙØ§Ø´'];

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _deposit() async {
    if (_amountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ÙØ±Ø¬Ù Ø¥Ø¯Ø®Ø§Ù Ø§ÙÙØ¨ÙØº', style: TextStyle(fontFamily: 'Changa')),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    // ÙØ­Ø§ÙØ§Ø© Ø¹ÙÙÙØ© Ø§ÙØ¥ÙØ¯Ø§Ø¹
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ØªÙ Ø¥Ø±Ø³Ø§Ù Ø·ÙØ¨ Ø§ÙØ¥ÙØ¯Ø§Ø¹ Ø¨ÙØ¬Ø§Ø­', style: TextStyle(fontFamily: 'Changa')),
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
      appBar: const SimpleAppBar(title: 'Ø¥ÙØ¯Ø§Ø¹'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ø¨Ø·Ø§ÙØ© Ø§ÙØ±ØµÙØ¯
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
                  const Text(
                    'Ø§ÙØ±ØµÙØ¯ Ø§ÙØ­Ø§ÙÙ',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 14,
                      color: AppTheme.darkText,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '125,000 Ø±.Ù',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkText,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Ø§Ø®ØªÙØ§Ø± Ø§ÙØ¹ÙÙØ©
            Text(
              'Ø§ÙØ¹ÙÙØ©',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.getTextColor(context),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: _currencies.map((currency) {
                final isSelected = _selectedCurrency == currency;
                return ChoiceChip(
                  label: Text(
                    currency,
                    style: TextStyle(
                      fontFamily: 'Changa',
                      color: isSelected ? AppTheme.darkText : AppTheme.getTextColor(context),
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: AppTheme.goldColor,
                  backgroundColor: AppTheme.getCardColor(context),
                  onSelected: (selected) {
                    if (selected) {
                      setState(() => _selectedCurrency = currency);
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            // Ø§ÙÙØ¨ÙØº
            Text(
              'Ø§ÙÙØ¨ÙØº',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.getTextColor(context),
              ),
            ),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Container(
                  margin: const EdgeInsets.all(12),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.goldColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Ø±.Ù',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      color: AppTheme.goldColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Ø·Ø±ÙÙØ© Ø§ÙØ¯ÙØ¹
            Text(
              'Ø·Ø±ÙÙØ© Ø§ÙØ¯ÙØ¹',
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.getTextColor(context),
              ),
            ),
            const SizedBox(height: 12),
            ..._methods.map((method) {
              return RadioListTile<String>(
                title: Text(
                  method,
                  style: const TextStyle(fontFamily: 'Changa'),
                ),
                value: method,
                groupValue: _selectedMethod,
                activeColor: AppTheme.goldColor,
                onChanged: (value) {
                  setState(() => _selectedMethod = value!);
                },
              );
            }).toList(),
            const SizedBox(height: 32),
            // Ø²Ø± Ø§ÙØ¥ÙØ¯Ø§Ø¹
            CustomButton(
              text: 'Ø¥ÙØ¯Ø§Ø¹',
              onPressed: _deposit,
              isLoading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}