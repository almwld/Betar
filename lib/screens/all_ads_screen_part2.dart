import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class AllAdsScreenPart2 extends StatelessWidget {
  const AllAdsScreenPart2({super.key});

  final List<Map<String, dynamic>> _categories = const [
    // Ø§ÙØµØ­Ø© ÙØ§ÙØ¬ÙØ§Ù (8)
    {'name': 'ÙØ³ØªØ­Ø¶Ø±Ø§Øª ØªØ¬ÙÙÙ', 'icon': Icons.face, 'color': Colors.pink},
    {'name': 'Ø¹ÙØ§ÙØ© Ø¨Ø§ÙØ¨Ø´Ø±Ø©', 'icon': Icons.spa, 'color': Colors.purple},
    {'name': 'Ø¹Ø·ÙØ±', 'icon': Icons.emoji_emotions, 'color': Colors.amber},
    {'name': 'ÙÙÙØ§Ø¬', 'icon': Icons.brush, 'color': Colors.red},
    {'name': 'Ø£Ø¯ÙØ§Øª Ø­ÙØ§ÙØ©', 'icon': Icons.cut, 'color': Colors.blue},
    {'name': 'Ø¹ÙØ§ÙØ© Ø¨Ø§ÙØ´Ø¹Ø±', 'icon': Icons.content_cut, 'color': Colors.teal},
    {'name': 'Ø³Ø¨Ø§', 'icon': Icons.hot_tub, 'color': Colors.cyan},
    {'name': 'ØµÙØ¯ÙÙØ§Øª', 'icon': Icons.local_pharmacy, 'color': Colors.green},

    // Ø§ÙØ£Ø¬ÙØ²Ø© Ø§ÙÙÙØ²ÙÙØ© (7)
    {'name': 'Ø«ÙØ§Ø¬Ø§Øª', 'icon': Icons.kitchen, 'color': Colors.cyan},
    {'name': 'ØºØ³Ø§ÙØ§Øª', 'icon': Icons.local_laundry_service, 'color': Colors.blue},
    {'name': 'ÙÙÙÙØ§Øª', 'icon': Icons.ac_unit, 'color': Colors.lightBlue},
    {'name': 'Ø£ÙØ±Ø§Ù', 'icon': Icons.kitchen, 'color': Colors.orange},
    {'name': 'ÙÙØ§ÙØ³', 'icon': Icons.cleaning_services, 'color': Colors.purple},
    {'name': 'ÙØ±Ø§ÙØ­', 'icon': Icons.toys, 'color': Colors.green},
    {'name': 'Ø³Ø®Ø§ÙØ§Øª', 'icon': Icons.water, 'color': Colors.red},

    // Ø§ÙÙØ·Ø¨Ø® ÙØ§ÙØ·Ø¹Ø§Ù (6)
    {'name': 'Ø£ÙØ§ÙÙ', 'icon': Icons.kitchen, 'color': Colors.brown},
    {'name': 'Ø£Ø¬ÙØ²Ø© ÙØ·Ø¨Ø®', 'icon': Icons.coffee_maker, 'color': Colors.amber},
    {'name': 'Ø¨ÙØ§Ø±Ø§Øª', 'icon': Icons.grass, 'color': Colors.green},
    {'name': 'ØªÙÙØ±', 'icon': Icons.date_range, 'color': Colors.brown},
    {'name': 'Ø¹Ø³Ù', 'icon': Icons.water_drop, 'color': Colors.amber},
    {'name': 'ÙÙÙØ©', 'icon': Icons.coffee, 'color': Colors.brown},

    // Ø§ÙØ­Ø±Ù ÙØ§ÙØªØ­Ù (5)
    {'name': 'Ø¬ÙØ§Ø¨Ù', 'icon': Icons.agriculture, 'color': Colors.brown},
    {'name': 'Ø³Ø¬Ø§Ø¯', 'icon': Icons.carpenter, 'color': Colors.red},
    {'name': 'ÙØ¶ÙØ§Øª', 'icon': Icons.diamond, 'color': Colors.grey},
    {'name': 'ÙØ­Ø§Ø³ÙØ§Øª', 'icon': Icons.kitchen, 'color': Colors.amber},
    {'name': 'ØªØ­Ù', 'icon': Icons.history, 'color': Colors.brown},

    // ÙÙØ§Ø¯ Ø§ÙØ¨ÙØ§Ø¡ (6)
    {'name': 'Ø­Ø¯ÙØ¯', 'icon': Icons.construction, 'color': Colors.grey},
    {'name': 'Ø£Ø³ÙÙÑ', 'icon': Icons.inventory, 'color': Colors.brown},
    {'name': 'Ø±ÙÙ', 'icon': Icons.landscape, 'color': Colors.yellow},
    {'name': 'Ø³ÙØ±Ø§ÙÙÙ', 'icon': Icons.grid_on, 'color': Colors.blue},
    {'name': 'Ø¯ÙØ§ÙØ§Øª', 'icon': Icons.brush, 'color': Colors.purple},
    {'name': 'Ø£Ø¯ÙØ§Øª ØµØ­ÙØ©', 'icon': Icons.bathtub, 'color': Colors.cyan},

    // Ø§ÙØ²Ø±Ø§Ø¹Ø© (5)
    {'name': 'Ø¨Ø°ÙØ±', 'icon': Icons.grass, 'color': Colors.green},
    {'name': 'Ø´ØªÙØ§Øª', 'icon': Icons.eco, 'color': Colors.lightGreen},
    {'name': 'Ø£Ø³ÙØ¯Ø©', 'icon': Icons.agriculture, 'color': Colors.brown},
    {'name': 'ÙØ¨ÙØ¯Ø§Øª', 'icon': Icons.science, 'color': Colors.red},
    {'name': 'Ø£Ø¯ÙØ§Øª Ø²Ø±Ø§Ø¹ÙØ©', 'icon': Icons.agriculture, 'color': Colors.orange},

    // Ø§ÙØªØ¹ÙÙÙ (4)
    {'name': 'Ø¯ÙØ±Ø§Øª', 'icon': Icons.school, 'color': Colors.blue},
    {'name': 'ÙØªØ¨ ØªØ¹ÙÙÙÙØ©', 'icon': Icons.menu_book, 'color': Colors.green},
    {'name': 'ÙØ³ØªÙØ²ÙØ§Øª', 'icon': Icons.backpack, 'color': Colors.orange},
    {'name': 'ÙØ¹Ø§ÙØ¯', 'icon': Icons.location_city, 'color': Colors.purple},

    // Ø§ÙØ³ÙØ± (4)
    {'name': 'ÙÙØ§Ø¯Ù', 'icon': Icons.hotel, 'color': Colors.blue},
    {'name': 'Ø±Ø­ÙØ§Øª', 'icon': Icons.tour, 'color': Colors.green},
    {'name': 'ØªØ°Ø§ÙØ±', 'icon': Icons.flight, 'color': Colors.orange},
    {'name': 'ØªØ£Ø¬ÙØ± Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.car_rental, 'color': Colors.red},

    // Ø§ÙÙØ²Ø§Ø¯Ø§Øª (3)
    {'name': 'ÙØ²Ø§Ø¯Ø§Øª Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.directions_car, 'color': Colors.red},
    {'name': 'ÙØ²Ø§Ø¯Ø§Øª Ø¹ÙØ§Ø±Ø§Øª', 'icon': Icons.home, 'color': Colors.green},
    {'name': 'ÙØ²Ø§Ø¯Ø§Øª ØªØ­Ù', 'icon': Icons.history, 'color': Colors.brown},

    // Ø§ÙØªØ¨Ø±Ø¹Ø§Øª (3)
    {'name': 'ØªØ¨Ø±Ø¹Ø§Øª ÙØ§ÙÙØ©', 'icon': Icons.volunteer_activism, 'color': Colors.green},
    {'name': 'ØªØ¨Ø±Ø¹Ø§Øª Ø¹ÙÙÙØ©', 'icon': Icons.card_giftcard, 'color': Colors.orange},
    {'name': 'Ø­ÙÙØ§Øª Ø®ÙØ±ÙØ©', 'icon': Icons.favorite, 'color': Colors.red},

    // Ø§ÙÙÙØ§ÙÙØ§Øª (4)
    {'name': 'ÙØ¯Ø§ÙØ§', 'icon': Icons.card_giftcard, 'color': Colors.red},
    {'name': 'Ø³Ø§Ø¹Ø§Øª ÙØ§Ø®Ø±Ø©', 'icon': Icons.watch, 'color': Colors.amber},
    {'name': 'ÙØ¸Ø§Ø±Ø§Øª', 'icon': Icons.visibility, 'color': Colors.blue},
    {'name': 'ÙØ¬ÙÙØ±Ø§Øª', 'icon': Icons.diamond, 'color': Colors.purple},

    // Ø§ÙÙØ¹Ø¯Ø§Øª Ø§ÙØ«ÙÙÙØ© (4)
    {'name': 'Ø­ÙØ§Ø±Ø§Øª', 'icon': Icons.construction, 'color': Colors.yellow},
    {'name': 'Ø±Ø§ÙØ¹Ø§Øª', 'icon': Icons.construction, 'color': Colors.orange},
    {'name': 'Ø¨ÙØ¯ÙØ²Ø±Ø§Øª', 'icon': Icons.do_not_disturb, 'color': Colors.red},
    {'name': 'Ø´ÙÙÙØ§Øª', 'icon': Icons.local_shipping, 'color': Colors.blue},

    // Ø§ÙØ¨Ø±ÙØ¬ÙØ§Øª (3)
    {'name': 'ØªØ·Ø¨ÙÙØ§Øª', 'icon': Icons.apps, 'color': Colors.blue},
    {'name': 'Ø¨Ø±Ø§ÙØ¬', 'icon': Icons.computer, 'color': Colors.green},
    {'name': 'Ø£ÙØ¹Ø§Ø¨', 'icon': Icons.videogame_asset, 'color': Colors.purple},

    // Ø§ÙØ£ÙÙ (3)
    {'name': 'ÙØ§ÙÙØ±Ø§Øª', 'icon': Icons.videocam, 'color': Colors.blue},
    {'name': 'Ø¥ÙØ°Ø§Ø±', 'icon': Icons.warning, 'color': Colors.red},
    {'name': 'Ø£ÙÙØ§Ù', 'icon': Icons.lock, 'color': Colors.grey},

    // Ø§ÙÙÙØ³ÙÙÙ (3)
    {'name': 'Ø¢ÙØ§Øª ÙÙØ³ÙÙÙØ©', 'icon': Icons.music_note, 'color': Colors.purple},
    {'name': 'Ø³ÙØ§Ø¹Ø§Øª', 'icon': Icons.speaker, 'color': Colors.blue},
    {'name': 'ÙÙØ¨Ø±Ø§Øª', 'icon': Icons.headphones, 'color': Colors.red},

    // Ø§ÙØ¹ÙÙØ§Øª (2)
    {'name': 'Ø¹ÙÙØ§Øª ÙØ¯ÙÙØ©', 'icon': Icons.monetization_on, 'color': Colors.amber},
    {'name': 'Ø·ÙØ§Ø¨Ø¹', 'icon': Icons.markunread_mailbox, 'color': Colors.green},

    // Ø§ÙØ³ÙÙÙØ§ (2)
    {'name': 'Ø£ÙÙØ§Ù', 'icon': Icons.movie, 'color': Colors.red},
    {'name': 'ÙØ³ÙØ³ÙØ§Øª', 'icon': Icons.tv, 'color': Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ£ÙØ³Ø§Ù - Ø§ÙØ¬Ø²Ø¡ Ø§ÙØ«Ø§ÙÙ'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final cat = _categories[index];
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: (cat['color'] as Color).withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(cat['icon'] as IconData, color: cat['color'], size: 24),
                  ),
                  const SizedBox(height: 8),
                  Text(cat['name'], style: TextStyle(fontFamily: 'Changa', fontSize: 11), textAlign: TextAlign.center),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}