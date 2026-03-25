import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  final List<Map<String, dynamic>> _games = const [
    {'name': 'Ø¨ÙØ§Ù Ø³ØªÙØ´Ù', 'icon': Icons.sports_esports, 'color': Colors.blue, 'count': '234'},
    {'name': 'Ø§ÙØ³ Ø¨ÙÙØ³', 'icon': Icons.videogame_asset, 'color': Colors.green, 'count': '156'},
    {'name': 'ÙÙÙØªÙØ¯Ù', 'icon': Icons.gamepad, 'color': Colors.red, 'count': '89'},
    {'name': 'Ø£ÙØ¹Ø§Ø¨ ÙÙØ¨ÙÙØªØ±', 'icon': Icons.computer, 'color': Colors.purple, 'count': '123'},
    {'name': 'Ø£ÙØ¹Ø§Ø¨ Ø¬ÙØ§Ù', 'icon': Icons.phone_android, 'color': Colors.orange, 'count': '98'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ£ÙØ¹Ø§Ø¨'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _games.length,
        itemBuilder: (context, index) {
          final game = _games[index];
          return Container(
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: (game['color'] as Color).withOpacity(0.3)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(game['icon'] as IconData, color: game['color'], size: 40),
                const SizedBox(height: 8),
                Text(game['name'], style: const TextStyle(fontFamily: 'Changa', fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('${game['count']} ÙØ¹Ø¨Ø©', style: const TextStyle(fontFamily: 'Changa', fontSize: 11, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}