import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';

class SimpleTestScreen extends StatelessWidget {
  const SimpleTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ø§Ø®ØªØ¨Ø§Ø± Ø¨Ø³ÙØ·'),
      ),
      body: const Center(
        child: Text(
          'Ø¥Ø°Ø§ Ø¸ÙØ± ÙØ°Ø§ Ø§ÙÙØµØ ÙØ§ÙÙØ´ÙÙØ© ÙÙØ³Øª ÙÙ Ø§ÙØªÙÙÙ',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}