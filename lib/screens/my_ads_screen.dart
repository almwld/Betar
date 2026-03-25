import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';
import '../../widgets/empty_state.dart';

class MyAdsScreen extends StatelessWidget {
  const MyAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasAds = false; // ØªØºÙÙØ± ÙØ¹Ø±Ø¶ Ø§ÙØ¥Ø¹ÙØ§ÙØ§Øª

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø¥Ø¹ÙØ§ÙØ§ØªÙ'),
      body: hasAds
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(color: AppTheme.goldColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.image, color: AppTheme.goldColor),
                  ),
                  title: Text('Ø¥Ø¹ÙØ§Ù ${index + 1}', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
                  subtitle: Text('${(index + 1) * 10000} Ø±.Ù', style: const TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'edit', child: Text('ØªØ¹Ø¯ÙÙ', style: TextStyle(fontFamily: 'Changa'))),
                      const PopupMenuItem(value: 'delete', child: Text('Ø­Ø°Ù', style: TextStyle(fontFamily: 'Changa', color: AppTheme.error))),
                    ],
                  ),
                ),
              ),
            )
          : NoAdsState(onAddAd: () => Navigator.pushNamed(context, '/add_ad')),
    );
  }
}