import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class ElectronicsScreen extends StatelessWidget {
  const ElectronicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø¥ÙÙØªØ±ÙÙÙØ§Øª'),
      body: const Center(
        child: Text('ÙØ³Ù Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ§Øª'),
      ),
    );
  }
}