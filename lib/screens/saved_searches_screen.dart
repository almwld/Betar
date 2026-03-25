import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class SavedSearchesScreen extends StatelessWidget {
  const SavedSearchesScreen({super.key});

  final List<Map<String, dynamic>> _saved = const [
    {'query': 'Ø¢ÙÙÙÙ ÙÙØ¨ÙØ¹', 'filters': 'ØµÙØ¹Ø§Ø¡ â¢ Ø§ÙØ³Ø¹Ø±: 200k-500k', 'date': 'ÙÙØ° ÙÙÙÙÙ'},
    {'query': 'Ø³ÙØ§Ø±Ø© ÙØ³ØªØ¹ÙÙØ©', 'filters': 'Ø¹Ø¯Ù â¢ ÙÙØ¯ÙÙ 2020+', 'date': 'ÙÙØ° 5 Ø£ÙØ§Ù'},
    {'query': 'Ø´ÙØ© ÙÙØ¥ÙØ¬Ø§Ø±', 'filters': 'ØªØ¹Ø² â¢ ØºØ±ÙØªÙÙ', 'date': 'ÙÙØ° Ø£Ø³Ø¨ÙØ¹'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø¹ÙÙÙØ§Øª Ø§ÙØ¨Ø­Ø« Ø§ÙÙØ­ÙÙØ¸Ø©'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _saved.length,
        itemBuilder: (ctx, i) {
          final s = _saved[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.search, color: AppTheme.goldColor),
              title: Text(s['query']),
              subtitle: Text('${s['filters']} â¢ ${s['date']}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {},
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}