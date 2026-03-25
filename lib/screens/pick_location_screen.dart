import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({super.key});

  @override
  State<PickLocationScreen> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  String _selectedLocation = 'ÙÙ ÙØªÙ Ø§ÙØ§Ø®ØªÙØ§Ø±';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§Ø®ØªØ± Ø§ÙÙÙÙØ¹'),
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
                  Text('Ø­Ø±Ù Ø§ÙØ®Ø±ÙØ·Ø© ÙØ§Ø®ØªÙØ§Ø± Ø§ÙÙÙÙØ¹', style: TextStyle(fontFamily: 'Changa')),
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
              ),
              child: Column(
                children: [
                  Text('Ø§ÙÙÙÙØ¹ Ø§ÙÙØ®ØªØ§Ø±: $_selectedLocation', style: const TextStyle(fontFamily: 'Changa')),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'ØªØ£ÙÙØ¯ Ø§ÙÙÙÙØ¹',
                    onPressed: () {
                      Navigator.pop(context, _selectedLocation);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}