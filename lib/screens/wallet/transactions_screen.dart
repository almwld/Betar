import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  final List<Map<String, dynamic>> transactions = const [
    {'type': 'Ø¥ÙØ¯Ø§Ø¹', 'amount': '+50,000', 'date': '2024-01-15', 'status': 'ÙÙØªÙÙ'},
    {'type': 'Ø³Ø­Ø¨', 'amount': '-20,000', 'date': '2024-01-14', 'status': 'ÙÙØªÙÙ'},
    {'type': 'ØªØ­ÙÙÙ', 'amount': '-15,000', 'date': '2024-01-13', 'status': 'ÙÙØªÙÙ'},
    {'type': 'Ø¯ÙØ¹', 'amount': '-5,000', 'date': '2024-01-12', 'status': 'ÙÙØªÙÙ'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø³Ø¬Ù Ø§ÙØ¹ÙÙÙØ§Øª'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final t = transactions[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: t['amount'].toString().startsWith('+') ? AppTheme.success.withOpacity(0.1) : AppTheme.error.withOpacity(0.1),
                child: Icon(
                  t['amount'].toString().startsWith('+') ? Icons.arrow_downward : Icons.arrow_upward,
                  color: t['amount'].toString().startsWith('+') ? AppTheme.success : AppTheme.error,
                ),
              ),
              title: Text(t['type'], style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
              subtitle: Text(t['date'], style: TextStyle(fontFamily: 'Changa', color: AppTheme.getSecondaryTextColor(context))),
              trailing: Text(
                t['amount'],
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontWeight: FontWeight.bold,
                  color: t['amount'].toString().startsWith('+') ? AppTheme.success : AppTheme.error,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}