import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';
import 'all_ads_screen.dart';
import 'wallet/wallet_screen.dart';
import 'chat_screen.dart';
import 'profile_screen.dart';

/// Ø§ÙØ´Ø±ÙØ· Ø§ÙØ³ÙÙÙ Ø§ÙØ±Ø¦ÙØ³Ù ÙÙØªÙÙÙ
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AllAdsScreen(),
    const Placeholder(), // ÙÙØ§Ù ÙÙØ²Ø± Ø§ÙØ¹Ø§Ø¦Ù
    const WalletScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      // Ø§ÙØ²Ø± Ø§ÙØ¹Ø§Ø¦Ù - Ø¥Ø¶Ø§ÙØ© Ø¥Ø¹ÙØ§Ù
      Navigator.pushNamed(context, '/add_ad');
      return;
    }
    
    // ØªØ¹Ø¯ÙÙ Ø§ÙÙÙØ±Ø³ ÙÙØ´Ø§Ø´Ø§Øª Ø§ÙÙØ¹ÙÙØ©
    int actualIndex = index > 2 ? index - 1 : index;
    
    setState(() {
      _currentIndex = actualIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          const AllAdsScreen(),
          const WalletScreen(),
          const ChatScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home_outlined, 'Ø§ÙØ±Ø¦ÙØ³ÙØ©', 0),
                _buildNavItem(Icons.storefront_outlined, 'Ø§ÙÙØªØ¬Ø±', 1),
                _buildAddButton(),
                _buildNavItem(Icons.account_balance_wallet_outlined, 'Ø§ÙÙØ­ÙØ¸Ø©', 3),
                _buildNavItem(Icons.chat_bubble_outline, 'Ø§ÙØ¯Ø±Ø¯Ø´Ø©', 4),
                _buildNavItem(Icons.person_outline, 'Ø­Ø³Ø§Ø¨Ù', 5),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == (index > 2 ? index - 1 : index);
    
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.goldColor.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.goldColor : AppTheme.getSecondaryTextColor(context),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 11,
                color: isSelected ? AppTheme.goldColor : AppTheme.getSecondaryTextColor(context),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () => _onItemTapped(2),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          gradient: AppTheme.goldGradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.goldColor.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(
          Icons.add,
          color: AppTheme.darkText,
          size: 32,
        ),
      ),
    );
  }
}