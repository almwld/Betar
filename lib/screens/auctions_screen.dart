import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class AuctionsScreen extends StatelessWidget {
  const AuctionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'Ø§ÙÙØ²Ø§Ø¯Ø§Øª'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: Column(
            children: [
              Container(height: 150, color: AppTheme.goldColor.withOpacity(0.1), child: const Icon(Icons.gavel, size: 50, color: AppTheme.goldColor)),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text('ÙØ²Ø§Ø¯ ${index + 1}', style: TextStyle(fontFamily: 'Changa', fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppTheme.error.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: const Text('02:30:15', style: TextStyle(fontFamily: 'Changa', color: AppTheme.error))),
                        const Text('500,000 Ø±.Ù', style: TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.bold, color: AppTheme.goldColor)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}