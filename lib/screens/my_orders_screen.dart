import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';
import '../../widgets/empty_state.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasOrders = false;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø·ÙØ¨Ø§ØªÙ'),
      body: hasOrders
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text('Ø·ÙØ¨ #${1000 + index}', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
                  subtitle: Text('${(index + 1) * 50000} Ø±.Ù', style: const TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.success.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: const Text('ÙÙØªÙÙ', style: TextStyle(fontFamily: 'Changa', color: AppTheme.success, fontSize: 12)),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/order_detail'),
                ),
              ),
            )
          : NoOrdersState(onShopNow: () => Navigator.pushNamed(context, '/all_ads')),
    );
  }
}