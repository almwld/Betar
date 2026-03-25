import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class AllAdsScreenPart1 extends StatelessWidget {
  const AllAdsScreenPart1({super.key});

  final List<Map<String, dynamic>> _categories = const [
    // Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ§Øª (7)
    {'name': 'ÙÙØ§ØªÙ Ø°ÙÙØ©', 'icon': Icons.phone_android, 'color': Colors.blue},
    {'name': 'ÙØ§Ø¨ØªÙØ¨', 'icon': Icons.laptop, 'color': Colors.indigo},
    {'name': 'ØªØ§Ø¨ÙØª', 'icon': Icons.tablet, 'color': Colors.cyan},
    {'name': 'Ø³Ø§Ø¹Ø§Øª Ø°ÙÙØ©', 'icon': Icons.watch, 'color': Colors.teal},
    {'name': 'ÙØ§ÙÙØ±Ø§Øª', 'icon': Icons.camera_alt, 'color': Colors.purple},
    {'name': 'Ø³ÙØ§Ø¹Ø§Øª', 'icon': Icons.headphones, 'color': Colors.deepPurple},
    {'name': 'Ø§ÙØ³Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.usb, 'color': Colors.pink},

    // Ø§ÙØ³ÙØ§Ø±Ø§Øª (8)
    {'name': 'Ø³ÙØ§Ø±Ø§Øª ÙÙØ¨ÙØ¹', 'icon': Icons.directions_car, 'color': Colors.red},
    {'name': 'Ø³ÙØ§Ø±Ø§Øª ÙÙØ¥ÙØ¬Ø§Ø±', 'icon': Icons.car_rental, 'color': Colors.orange},
    {'name': 'ÙØ·Ø¹ ØºÙØ§Ø±', 'icon': Icons.build, 'color': Colors.brown},
    {'name': 'Ø§ÙØ³Ø³ÙØ§Ø±Ø§Øª Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.tire_repair, 'color': Colors.grey},
    {'name': 'Ø¯Ø±Ø§Ø¬Ø§Øª ÙØ§Ø±ÙØ©', 'icon': Icons.motorcycle, 'color': Colors.deepOrange},
    {'name': 'ÙÙØ§Ø±Ø¨', 'icon': Icons.sailing, 'color': Colors.lightBlue},
    {'name': 'Ø´Ø§Ø­ÙØ§Øª', 'icon': Icons.local_shipping, 'color': Colors.amber},
    {'name': 'ÙØ¹Ø¯Ø§Øª Ø«ÙÙÙØ©', 'icon': Icons.construction, 'color': Colors.yellow},

    // Ø§ÙØ¹ÙØ§Ø±Ø§Øª (6)
    {'name': 'Ø´ÙÙ ÙÙØ¨ÙØ¹', 'icon': Icons.apartment, 'color': Colors.green},
    {'name': 'Ø´ÙÙ ÙÙØ¥ÙØ¬Ø§Ø±', 'icon': Icons.home, 'color': Colors.lightGreen},
    {'name': 'ÙÙÙ', 'icon': Icons.villa, 'color': Colors.lime},
    {'name': 'Ø£Ø±Ø§Ø¶Ù', 'icon': Icons.terrain, 'color': Colors.green},
    {'name': 'ÙØ­ÙØ§Øª', 'icon': Icons.store, 'color': Colors.teal},
    {'name': 'ÙÙØ§ØªØ¨', 'icon': Icons.business, 'color': Colors.blueGrey},

    // Ø§ÙØ£Ø«Ø§Ø« (5)
    {'name': 'ØºØ±Ù ÙÙÙ', 'icon': Icons.bed, 'color': Colors.brown},
    {'name': 'ØºØ±Ù ÙØ¹ÙØ´Ø©', 'icon': Icons.chair, 'color': Colors.amber},
    {'name': 'ÙØ·Ø§Ø¨Ø®', 'icon': Icons.kitchen, 'color': Colors.deepOrange},
    {'name': 'ÙÙØ§ØªØ¨', 'icon': Icons.desk, 'color': Colors.indigo},
    {'name': 'Ø¥Ø¶Ø§Ø¡Ø©', 'icon': Icons.light, 'color': Colors.yellow},

    // Ø§ÙÙÙØ§Ø¨Ø³ (6)
    {'name': 'Ø±Ø¬Ø§ÙÙ', 'icon': Icons.man, 'color': Colors.blue},
    {'name': 'ÙØ³Ø§Ø¦Ù', 'icon': Icons.woman, 'color': Colors.pink},
    {'name': 'Ø£Ø·ÙØ§Ù', 'icon': Icons.child_care, 'color': Colors.teal},
    {'name': 'Ø£Ø­Ø°ÙØ©', 'icon': Icons.shopping_bag, 'color': Colors.brown},
    {'name': 'Ø§ÙØ³Ø³ÙØ§Ø±Ø§Øª', 'icon': Icons.watch, 'color': Colors.purple},
    {'name': 'Ø³Ø§Ø¹Ø§Øª', 'icon': Icons.watch, 'color': Colors.deepPurple},

    // Ø§ÙÙØ·Ø§Ø¹Ù ÙØ§ÙØ£ÙÙ (5)
    {'name': 'ÙØ·Ø§Ø¹Ù', 'icon': Icons.restaurant, 'color': Colors.red},
    {'name': 'ÙÙØ§ÙÙ', 'icon': Icons.local_cafe, 'color': Colors.brown},
    {'name': 'Ø­ÙÙÙØ§Øª', 'icon': Icons.cake, 'color': Colors.pink},
    {'name': 'ÙØ®Ø§Ø¨Ø²', 'icon': Icons.bakery_dining, 'color': Colors.orange},
    {'name': 'ÙØ¬Ø¨Ø§Øª Ø³Ø±ÙØ¹Ø©', 'icon': Icons.fastfood, 'color': Colors.deepOrange},

    // Ø§ÙØ®Ø¯ÙØ§Øª (7)
    {'name': 'ØµÙØ§ÙØ©', 'icon': Icons.build, 'color': Colors.grey},
    {'name': 'ØªÙØ¸ÙÙ', 'icon': Icons.cleaning_services, 'color': Colors.cyan},
    {'name': 'ØªØµÙÙØ­', 'icon': Icons.plumbing, 'color': Colors.brown},
    {'name': 'ÙÙÙ', 'icon': Icons.local_shipping, 'color': Colors.amber},
    {'name': 'ØªØ¹ÙÙÙ', 'icon': Icons.school, 'color': Colors.green},
    {'name': 'ØµØ­Ø©', 'icon': Icons.health_and_safety, 'color': Colors.red},
    {'name': 'Ø¬ÙØ§Ù', 'icon': Icons.face, 'color': Colors.pink},

    // Ø§ÙØ­ÙÙØ§ÙØ§Øª (4)
    {'name': 'ÙÙØ§Ø¨', 'icon': Icons.pets, 'color': Colors.brown},
    {'name': 'ÙØ·Ø·', 'icon': Icons.pets, 'color': Colors.orange},
    {'name': 'Ø·ÙÙØ±', 'icon': Icons.flutter_dash, 'color': Colors.blue},
    {'name': 'Ø£Ø³ÙØ§Ù', 'icon': Icons.set_meal, 'color': Colors.teal},

    // Ø§ÙØ±ÙØ§Ø¶Ø© (4)
    {'name': 'Ø£Ø¯ÙØ§Øª Ø±ÙØ§Ø¶ÙØ©', 'icon': Icons.sports, 'color': Colors.green},
    {'name': 'ÙÙØ§Ø¨Ø³ Ø±ÙØ§Ø¶ÙØ©', 'icon': Icons.sports_handball, 'color': Colors.orange},
    {'name': 'Ø£ÙØ¯ÙØ©', 'icon': Icons.sports_soccer, 'color': Colors.blue},
    {'name': 'ÙØ¹Ø¯Ø§Øª', 'icon': Icons.fitness_center, 'color': Colors.red},

    // Ø§ÙÙØªØ¨ ÙØ§ÙÙØ±Ø·Ø§Ø³ÙØ© (3)
    {'name': 'ÙØªØ¨', 'icon': Icons.book, 'color': Colors.brown},
    {'name': 'ÙØ±Ø·Ø§Ø³ÙØ©', 'icon': Icons.create, 'color': Colors.purple},
    {'name': 'ÙØ³ØªÙØ²ÙØ§Øª ÙØ¯Ø±Ø³ÙØ©', 'icon': Icons.school, 'color': Colors.green},

    // Ø§ÙØ£ÙØ¹Ø§Ø¨ (4)
    {'name': 'Ø£ÙØ¹Ø§Ø¨ Ø¥ÙÙØªØ±ÙÙÙØ©', 'icon': Icons.videogame_asset, 'color': Colors.red},
    {'name': 'Ø£ÙØ¹Ø§Ø¨ Ø£Ø·ÙØ§Ù', 'icon': Icons.toys, 'color': Colors.pink},
    {'name': 'Ø¯ÙÙ', 'icon': Icons.emoji_people, 'color': Colors.purple},
    {'name': 'ÙÙØºÙ', 'icon': Icons.extension, 'color': Colors.amber},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ£ÙØ³Ø§Ù - Ø§ÙØ¬Ø²Ø¡ Ø§ÙØ£ÙÙ'),
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