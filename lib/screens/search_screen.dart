import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: SimpleAppBar(
        title: 'Ø¨Ø­Ø«',
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ø§Ø¨Ø­Ø« Ø¹Ù ÙÙØªØ¬...',
                prefixIcon: const Icon(Icons.search, color: AppTheme.goldColor),
                filled: true,
                fillColor: AppTheme.getCardColor(context),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text('Ø¹ÙÙÙØ§Øª Ø¨Ø­Ø« Ø­Ø¯ÙØ«Ø©', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.getTextColor(context))),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: ['ÙØ§ØªÙ', 'ÙØ§Ø¨ØªÙØ¨', 'Ø³ÙØ§Ø±Ø©', 'Ø¹ÙØ§Ø±'].map((tag) => Chip(
                    label: Text(tag, style: const TextStyle(fontFamily: 'Changa')),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () {},
                  )).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}