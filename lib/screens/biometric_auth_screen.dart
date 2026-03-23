import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class BiometricAuthScreen extends StatefulWidget {
  const BiometricAuthScreen({super.key});

  @override
  State<BiometricAuthScreen> createState() => _BiometricAuthScreenState();
}

class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
  bool _useBiometric = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙÙØµØ§Ø¯ÙØ© Ø§ÙØ¨ÙÙÙØªØ±ÙØ©'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Ø§Ø³ØªØ®Ø¯Ø§Ù Ø§ÙØ¨ØµÙØ© Ø£Ù Face ID ÙØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ'),
              value: _useBiometric,
              onChanged: (v) => setState(() => _useBiometric = v),
              secondary: const Icon(Icons.fingerprint, color: AppTheme.goldColor),
            ),
            if (_useBiometric) ...[
              const SizedBox(height: 30),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppTheme.goldColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.fingerprint, size: 60, color: AppTheme.goldColor),
              ),
              const SizedBox(height: 20),
              const Text('Ø§Ø¶ØºØ· ÙØªÙØ¹ÙÙ Ø§ÙØ¨ØµÙØ©', style: TextStyle(fontFamily: 'Changa')),
              const SizedBox(height: 20),
              CustomButton(
                text: 'ØªÙØ¹ÙÙ',
                onPressed: () {},
              ),
            ],
          ],
        ),
      ),
    );
  }
}