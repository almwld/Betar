import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'Ø­Ø³Ø§Ø¨Ù'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ÙØ¹ÙÙÙØ§Øª Ø§ÙÙØ³ØªØ®Ø¯Ù
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: AppTheme.goldGradient,
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 50, color: AppTheme.goldColor),
                  ),
                  const SizedBox(height: 16),
                  const Text('ÙØ­ÙØ¯ Ø£Ø­ÙØ¯', style: TextStyle(fontFamily: 'Changa', fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
                  const SizedBox(height: 8),
                  const Text('mohammed@email.com', style: TextStyle(fontFamily: 'Changa', color: AppTheme.darkText)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStat('Ø§ÙØ¥Ø¹ÙØ§ÙØ§Øª', '12'),
                      _buildStat('Ø§ÙÙØªØ§Ø¨Ø¹ÙÙ', '150'),
                      _buildStat('Ø§ÙØªÙÙÙÙ', '4.8'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Ø§ÙÙØ§Ø¦ÙØ©
            _buildMenuItem(context, 'Ø¥Ø¹ÙØ§ÙØ§ØªÙ', Icons.post_add, '/my_ads'),
            _buildMenuItem(context, 'Ø§ÙÙÙØ¶ÙØ©', Icons.favorite_border, '/favorites'),
            _buildMenuItem(context, 'Ø·ÙØ¨Ø§ØªÙ', Icons.shopping_bag_outlined, '/my_orders'),
            _buildMenuItem(context, 'ÙØ¹ÙÙÙØ§Øª Ø§ÙØ­Ø³Ø§Ø¨', Icons.person_outline, '/account_info'),
            _buildMenuItem(context, 'Ø§ÙØ¥Ø¹Ø¯Ø§Ø¯Ø§Øª', Icons.settings_outlined, '/settings'),
            _buildMenuItem(context, 'Ø§ÙÙØ³Ø§Ø¹Ø¯Ø©', Icons.help_outline, '/help_support'),
            const SizedBox(height: 24),
            // Ø²Ø± ØªØ³Ø¬ÙÙ Ø§ÙØ®Ø±ÙØ¬
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                icon: const Icon(Icons.logout),
                label: const Text('ØªØ³Ø¬ÙÙ Ø§ÙØ®Ø±ÙØ¬', style: TextStyle(fontFamily: 'Changa')),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.error,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontFamily: 'Changa', fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
        Text(label, style: const TextStyle(fontFamily: 'Changa', fontSize: 12, color: AppTheme.darkText)),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.goldColor),
      title: Text(title, style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}