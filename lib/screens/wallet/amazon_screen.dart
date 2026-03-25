import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';

class AmazonScreen extends StatefulWidget {
  const AmazonScreen({super.key});

  @override
  State<AmazonScreen> createState() => _AmazonScreenState();
}

class _AmazonScreenState extends State<AmazonScreen> {
  String _selectedRegion = 'Ø§ÙØ±ÙÙÙ';
  final List<String> _regions = ['Ø§ÙØ±ÙÙÙ', 'Ø³Ø¹ÙØ¯Ù', 'Ø§ÙØ§Ø±Ø§ØªÙ'];
  
  final List<Map<String, String>> _cards = const [
    {'value': '10', 'price': '6,240'},
    {'value': '15', 'price': '9,910'},
    {'value': '20', 'price': '12,870'},
    {'value': '25', 'price': '15,730'},
    {'value': '50', 'price': '31,150'},
    {'value': '100', 'price': '62,310'},
  ];

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø¨Ø·Ø§ÙØ§Øª Ø£ÙØ§Ø²ÙÙ'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('Ø§Ø®ØªØ± Ø§ÙÙÙØ·ÙØ©', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: _regions.map((region) {
                      final isSelected = _selectedRegion == region;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedRegion = region),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? AppTheme.goldColor : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: isSelected ? AppTheme.goldColor : Colors.grey),
                            ),
                            child: Text(
                              region,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Changa',
                                color: isSelected ? Colors.black : null,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Ø§Ø®ØªØ± Ø§ÙØ¨Ø§ÙØ©', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ..._cards.map((card) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ø£ÙØ§Ø²ÙÙ ${card['value']} Ø¯ÙÙØ§Ø±', style: const TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('${card['price']} Ø±ÙØ§Ù', style: const TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() => _isLoading = true);
                      Future.delayed(const Duration(seconds: 1), () {
                        setState(() => _isLoading = false);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('ØªÙ Ø´Ø±Ø§Ø¡ Ø§ÙØ¨Ø·Ø§ÙØ© Ø¨ÙØ¬Ø§Ø­Ø ØªØ­ÙÙ ÙÙ Ø¨Ø±ÙØ¯Ù Ø§ÙØ¥ÙÙØªØ±ÙÙÙ')),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.goldColor,
                      foregroundColor: Colors.black,
                    ),
                    child: _isLoading ? const CircularProgressIndicator() : const Text('Ø´Ø±Ø§Ø¡'),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}