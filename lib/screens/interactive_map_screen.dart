import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class InteractiveMapScreen extends StatelessWidget {
  const InteractiveMapScreen({super.key});

  final List<Map<String, dynamic>> _adsOnMap = const [
    {'title': 'Ø¢ÙÙÙÙ 15', 'lat': 15.3694, 'lng': 44.1910, 'price': '450,000'},
    {'title': 'Ø´ÙØ© ÙÙ Ø­Ø¯Ø©', 'lat': 15.3547, 'lng': 44.2067, 'price': '35,000,000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ®Ø±ÙØ·Ø© Ø§ÙØªÙØ§Ø¹ÙÙØ©'),
      body: Stack(
        children: [
          Container(
            color: Colors.grey[300],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('Ø³ÙØªÙ Ø¯ÙØ¬ Ø§ÙØ®Ø±ÙØ·Ø© ÙØ±ÙØ¨Ø§Ù', style: TextStyle(fontFamily: 'Changa')),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppTheme.darkCard
                    : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ÙØ±ÙØ¨Ø© ÙÙÙ', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Changa')),
                  const SizedBox(height: 12),
                  ..._adsOnMap.map((ad) => ListTile(
                    leading: const Icon(Icons.location_on, color: AppTheme.goldColor),
                    title: Text(ad['title']),
                    subtitle: Text(ad['price']),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}