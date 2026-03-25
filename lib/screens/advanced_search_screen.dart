import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class AdvancedSearchScreen extends StatefulWidget {
  const AdvancedSearchScreen({super.key});

  @override
  State<AdvancedSearchScreen> createState() => _AdvancedSearchScreenState();
}

class _AdvancedSearchScreenState extends State<AdvancedSearchScreen> {
  final _keywordController = TextEditingController();
  RangeValues _priceRange = const RangeValues(0, 1000000);
  String? _selectedCategory;
  String? _selectedCity;
  bool _withImages = false;

  final List<String> _categories = ['Ø§ÙÙÙ', 'Ø¥ÙÙØªØ±ÙÙÙØ§Øª', 'Ø£Ø«Ø§Ø«', 'Ø³ÙØ§Ø±Ø§Øª', 'Ø¹ÙØ§Ø±Ø§Øª'];
  final List<String> _cities = ['Ø§ÙÙÙ', 'ØµÙØ¹Ø§Ø¡', 'Ø¹Ø¯Ù', 'ØªØ¹Ø²', 'Ø§ÙØ­Ø¯ÙØ¯Ø©'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø¨Ø­Ø« ÙØªÙØ¯Ù'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _keywordController,
              decoration: InputDecoration(
                labelText: 'ÙÙÙØ© Ø§ÙØ¨Ø­Ø«',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            const Text('ÙØ·Ø§Ù Ø§ÙØ³Ø¹Ø±', style: TextStyle(fontWeight: FontWeight.bold)),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 1000000,
              divisions: 10,
              labels: RangeLabels(
                '${_priceRange.start.round()} Ø±.Ù',
                '${_priceRange.end.round()} Ø±.Ù',
              ),
              onChanged: (v) => setState(() => _priceRange = v),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedCategory,
              hint: const Text('Ø§Ø®ØªØ± Ø§ÙÙØ¦Ø©'),
              items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCity,
              hint: const Text('Ø§Ø®ØªØ± Ø§ÙÙØ¯ÙÙØ©'),
              items: _cities.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _selectedCity = v),
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text('Ø¥Ø¹ÙØ§ÙØ§Øª Ø¨ÙØ§ ØµÙØ± ÙÙØ·'),
              value: _withImages,
              onChanged: (v) => setState(() => _withImages = v ?? false),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'Ø¨Ø­Ø«',
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ø¬Ø§Ø±Ù Ø§ÙØ¨Ø­Ø«...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}