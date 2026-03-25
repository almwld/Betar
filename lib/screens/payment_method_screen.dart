import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class PaymentMethod {
  final String id;
  final String name;
  final IconData icon;
  final String? subtitle;
  final bool isAvailable;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.icon,
    this.subtitle,
    this.isAvailable = true,
  });
}

class PaymentMethodScreen extends StatefulWidget {
  final Function(String) onSelect;
  const PaymentMethodScreen({super.key, required this.onSelect});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? _selectedMethod;
  final List<PaymentMethod> _methods = [
    PaymentMethod(
      id: 'wallet',
      name: 'Ø§ÙÙØ­ÙØ¸Ø©',
      icon: Icons.account_balance_wallet,
      subtitle: 'Ø§ÙØ±ØµÙØ¯: 125,000 Ø±.Ù',
    ),
    PaymentMethod(
      id: 'card',
      name: 'Ø¨Ø·Ø§ÙØ© Ø§Ø¦ØªÙØ§Ù',
      icon: Icons.credit_card,
      subtitle: 'â¢â¢â¢â¢ 4242',
    ),
    PaymentMethod(
      id: 'bank',
      name: 'ØªØ­ÙÙÙ Ø¨ÙÙÙ',
      icon: Icons.account_balance,
      subtitle: 'YE12 3456 7890',
    ),
    PaymentMethod(
      id: 'cash',
      name: 'Ø§ÙØ¯ÙØ¹ Ø¹ÙØ¯ Ø§ÙØ§Ø³ØªÙØ§Ù',
      icon: Icons.money,
      subtitle: 'Ø±Ø³ÙÙ Ø¥Ø¶Ø§ÙÙØ© 1,000 Ø±.Ù',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø·Ø±ÙÙØ© Ø§ÙØ¯ÙØ¹'),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _methods.length,
              itemBuilder: (ctx, i) {
                final m = _methods[i];
                final isSelected = _selectedMethod == m.id;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: isSelected ? AppTheme.goldColor.withOpacity(0.1) : null,
                  child: ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (isSelected ? AppTheme.goldColor : Colors.grey).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(m.icon, color: isSelected ? AppTheme.goldColor : Colors.grey),
                    ),
                    title: Text(m.name),
                    subtitle: m.subtitle != null ? Text(m.subtitle!) : null,
                    trailing: Radio<String>(
                      value: m.id,
                      groupValue: _selectedMethod,
                      onChanged: (v) => setState(() => _selectedMethod = v),
                    ),
                    onTap: () => setState(() => _selectedMethod = m.id),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: CustomButton(
              text: 'ØªØ£ÙÙØ¯',
              onPressed: _selectedMethod == null
                  ? null
                  : () {
                      widget.onSelect(_selectedMethod!);
                      Navigator.pop(context);
                    },
            ),
          ),
        ],
      ),
    );
  }
}