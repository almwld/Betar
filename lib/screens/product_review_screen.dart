import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class ProductReviewScreen extends StatefulWidget {
  const ProductReviewScreen({super.key});

  @override
  State<ProductReviewScreen> createState() => _ProductReviewScreenState();
}

class _ProductReviewScreenState extends State<ProductReviewScreen> {
  int _rating = 0;
  final _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'ØªÙÙÙÙ Ø§ÙÙÙØªØ¬'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('ÙÙÙ ÙØ§Ù Ø§ÙÙÙØªØ¬Ø', style: TextStyle(fontFamily: 'Changa', fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => IconButton(
                icon: Icon(index < _rating ? Icons.star : Icons.star_border, color: AppTheme.goldColor, size: 40),
                onPressed: () => setState(() => _rating = index + 1),
              )),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Ø§ÙØªØ¨ ØªÙÙÙÙÙ ÙÙØ§...',
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(text: 'Ø¥Ø±Ø³Ø§Ù Ø§ÙØªÙÙÙÙ', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}