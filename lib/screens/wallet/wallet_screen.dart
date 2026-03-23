import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';

/// Ø´Ø§Ø´Ø© Ø§ÙÙØ­ÙØ¸Ø© Ø§ÙØ±Ø¦ÙØ³ÙØ©
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int _currentCardIndex = 0;
  
  // Ø¨ÙØ§ÙØ§Øª ÙÙÙÙØ© ÙÙØ±ØµÙØ¯
  final List<Map<String, dynamic>> _balances = [
    {'currency': 'YER', 'amount': 125000.0, 'symbol': 'Ø±.Ù', 'name': 'Ø±ÙØ§Ù ÙÙÙÙ'},
    {'currency': 'SAR', 'amount': 2500.0, 'symbol': 'Ø±.Ø³', 'name': 'Ø±ÙØ§Ù Ø³Ø¹ÙØ¯Ù'},
    {'currency': 'USD', 'amount': 500.0, 'symbol': '\$', 'name': 'Ø¯ÙÙØ§Ø± Ø£ÙØ±ÙÙÙ'},
  ];

  // Ø®Ø¯ÙØ§Øª Ø§ÙÙØ­ÙØ¸Ø©
  final List<Map<String, dynamic>> _services = [
    {'name': 'Ø¥ÙØ¯Ø§Ø¹', 'icon': Icons.arrow_downward, 'route': '/deposit'},
    {'name': 'ØªØ­ÙÙÙ', 'icon': Icons.swap_horiz, 'route': '/transfer'},
    {'name': 'Ø³Ø­Ø¨', 'icon': Icons.arrow_upward, 'route': '/withdraw'},
    {'name': 'ÙÙØ§ØªÙØ±', 'icon': Icons.receipt_long, 'route': '/payments'},
    {'name': 'Ø§ÙØ¹ÙÙÙØ§Øª', 'icon': Icons.history, 'route': '/transactions'},
    {'name': 'Ø´Ø¨ÙØ© ØªØ­ÙÙÙ', 'icon': Icons.network_cell, 'route': '/transfer_network'},
    {'name': 'ØªØ±ÙÙÙ', 'icon': Icons.movie, 'route': '/entertainment'},
    {'name': 'Ø£ÙØ¹Ø§Ø¨', 'icon': Icons.sports_esports, 'route': '/games'},
    {'name': 'ØªØ·Ø¨ÙÙØ§Øª', 'icon': Icons.apps, 'route': '/apps'},
    {'name': 'Ø¨Ø·Ø§ÙØ§Øª ÙØª', 'icon': Icons.card_giftcard, 'route': '/gift_cards'},
    {'name': 'Ø£ÙØ§Ø²ÙÙ', 'icon': Icons.shopping_cart, 'route': '/amazon_gift_cards'},
    {'name': 'Ø¨ÙÙÙ ÙÙØ­Ø§ÙØ¸', 'icon': Icons.account_balance, 'route': '/banks_wallets'},
    {'name': 'ØªØ­ÙÙÙØ§Øª', 'icon': Icons.send, 'route': '/money_transfers'},
    {'name': 'ÙØ¯ÙÙØ¹Ø§Øª Ø­ÙÙÙÙØ©', 'icon': Icons.account_balance_wallet, 'route': '/government_payments'},
    {'name': 'ÙÙÙØ³Ù', 'icon': Icons.flash_on, 'route': '/jib'},
    {'name': 'Ø³Ø­Ø¨ ÙÙØ¯Ù', 'icon': Icons.money, 'route': '/cash_withdrawal'},
    {'name': 'ØªØ¹ÙÙÙ Ø¹Ø§ÙÙ', 'icon': Icons.school, 'route': '/universities'},
    {'name': 'Ø´Ø­Ù ÙØ³Ø¯Ø§Ø¯', 'icon': Icons.phone_android, 'route': '/recharge_payment'},
    {'name': 'Ø´Ø­Ù Ø±ØµÙØ¯', 'icon': Icons.signal_cellular_alt, 'route': '/recharge_credit'},
    {'name': 'Ø³Ø¯Ø§Ø¯ Ø¨Ø§ÙØ§Øª', 'icon': Icons.wifi, 'route': '/pay_bundles'},
    {'name': 'Ø¥ÙØªØ±ÙØª ÙÙØ§ØªÙ', 'icon': Icons.router, 'route': '/internet_landline'},
    {'name': 'Ø§Ø³ØªÙØ§Ù Ø­ÙØ§ÙØ©', 'icon': Icons.download, 'route': '/receive_transfer'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'Ø§ÙÙØ­ÙØ¸Ø©'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            // Ø¨Ø·Ø§ÙØ§Øª Ø§ÙØ±ØµÙØ¯
            _buildBalanceCards(),
            const SizedBox(height: 24),
            // ÙØ¤Ø´Ø±Ø§Øª Ø§ÙØ¨Ø·Ø§ÙØ§Øª
            _buildCardIndicators(),
            const SizedBox(height: 32),
            // Ø¹ÙÙØ§Ù Ø§ÙØ®Ø¯ÙØ§Øª
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Ø§ÙØ®Ø¯ÙØ§Øª',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Ø´Ø¨ÙØ© Ø§ÙØ®Ø¯ÙØ§Øª
            _buildServicesGrid(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCards() {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        itemCount: _balances.length,
        onPageChanged: (index) {
          setState(() {
            _currentCardIndex = index;
          });
        },
        itemBuilder: (context, index) {
          final balance = _balances[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              gradient: AppTheme.goldGradient,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.goldColor.withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                // ÙÙØ· Ø®ÙÙÙØ©
                Positioned(
                  right: -50,
                  top: -50,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  left: -30,
                  bottom: -30,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                // Ø§ÙÙØ­ØªÙÙ
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            balance['name'],
                            style: const TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 16,
                              color: AppTheme.darkText,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              balance['currency'],
                              style: const TextStyle(
                                fontFamily: 'Changa',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.darkText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'Ø§ÙØ±ØµÙØ¯ Ø§ÙØ­Ø§ÙÙ',
                        style: TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 14,
                          color: AppTheme.darkText.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${balance['amount'].toStringAsFixed(0)} ${balance['symbol']}',
                        style: const TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.darkText,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet,
                            color: AppTheme.darkText,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Flex Yemen Wallet',
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 12,
                              color: AppTheme.darkText.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn().scale(delay: const Duration(milliseconds: 200));
        },
      ),
    );
  }

  Widget _buildCardIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _balances.asMap().entries.map((entry) {
        return Container(
          width: _currentCardIndex == entry.key ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: _currentCardIndex == entry.key
                ? AppTheme.goldColor
                : Colors.grey.withOpacity(0.3),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildServicesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: _services.length,
        itemBuilder: (context, index) {
          final service = _services[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, service['route']);
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.getCardColor(context),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppTheme.goldColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      service['icon'],
                      color: AppTheme.goldColor,
                      size: 24,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    service['name'],
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 12,
                      color: AppTheme.getTextColor(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(
            delay: Duration(milliseconds: index * 30),
          ).scale(
            delay: Duration(milliseconds: index * 30),
          );
        },
      ),
    );
  }
}