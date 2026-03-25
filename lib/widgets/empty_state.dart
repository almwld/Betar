import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'custom_button.dart';

/// ÙÙØ¯Ø¬ Ø§ÙØ­Ø§ÙØ© Ø§ÙÙØ§Ø±ØºØ©
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.goldColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 50,
                color: AppTheme.goldColor,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppTheme.getTextColor(context),
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 14,
                  color: AppTheme.getSecondaryTextColor(context),
                ),
              ),
            ],
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: 24),
              CustomButton(
                text: buttonText!,
                onPressed: onButtonPressed,
                width: 200,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Ø­Ø§ÙØ© ÙØ§ ØªÙØ¬Ø¯ Ø¨ÙØ§ÙØ§Øª
class NoDataState extends StatelessWidget {
  final String? message;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const NoDataState({
    super.key,
    this.message,
    this.buttonText,
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.inbox_outlined,
      title: message ?? 'ÙØ§ ØªÙØ¬Ø¯ Ø¨ÙØ§ÙØ§Øª',
      subtitle: 'ÙÙ ÙØªÙ Ø§ÙØ¹Ø«ÙØ± Ø¹ÙÙ Ø£Ù Ø¹ÙØ§ØµØ± Ø­Ø§ÙÙØ§Ù',
      buttonText: buttonText,
      onButtonPressed: onButtonPressed,
    );
  }
}

/// Ø­Ø§ÙØ© ÙØ§ ØªÙØ¬Ø¯ ÙØªØ§Ø¦Ø¬ Ø¨Ø­Ø«
class NoSearchResultsState extends StatelessWidget {
  final String query;
  final VoidCallback? onClearSearch;

  const NoSearchResultsState({
    super.key,
    required this.query,
    this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.search_off,
      title: 'ÙØ§ ØªÙØ¬Ø¯ ÙØªØ§Ø¦Ø¬',
      subtitle: 'ÙÙ ÙØªÙ Ø§ÙØ¹Ø«ÙØ± Ø¹ÙÙ ÙØªØ§Ø¦Ø¬ ÙÙ "$query"',
      buttonText: 'ÙØ³Ø­ Ø§ÙØ¨Ø­Ø«',
      onButtonPressed: onClearSearch,
    );
  }
}

/// Ø­Ø§ÙØ© ÙØ§ ØªÙØ¬Ø¯ Ø¥Ø¹ÙØ§ÙØ§Øª
class NoAdsState extends StatelessWidget {
  final VoidCallback? onAddAd;

  const NoAdsState({
    super.key,
    this.onAddAd,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.post_add,
      title: 'ÙØ§ ØªÙØ¬Ø¯ Ø¥Ø¹ÙØ§ÙØ§Øª',
      subtitle: 'ÙÙ ØªÙÙ Ø¨Ø¥Ø¶Ø§ÙØ© Ø£Ù Ø¥Ø¹ÙØ§ÙØ§Øª Ø¨Ø¹Ø¯',
      buttonText: 'Ø¥Ø¶Ø§ÙØ© Ø¥Ø¹ÙØ§Ù',
      onButtonPressed: onAddAd,
    );
  }
}

/// Ø­Ø§ÙØ© ÙØ§ ØªÙØ¬Ø¯ ÙÙØ¶ÙØ©
class NoFavoritesState extends StatelessWidget {
  final VoidCallback? onBrowse;

  const NoFavoritesState({
    super.key,
    this.onBrowse,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.favorite_border,
      title: 'ÙØ§ ØªÙØ¬Ø¯ ÙÙØ¶ÙØ§Øª',
      subtitle: 'ÙÙ ØªÙÙ Ø¨Ø¥Ø¶Ø§ÙØ© Ø£Ù ÙÙØªØ¬Ø§Øª ÙÙÙÙØ¶ÙØ© Ø¨Ø¹Ø¯',
      buttonText: 'ØªØµÙØ­ Ø§ÙÙÙØªØ¬Ø§Øª',
      onButtonPressed: onBrowse,
    );
  }
}

/// Ø­Ø§ÙØ© ÙØ§ ØªÙØ¬Ø¯ Ø·ÙØ¨Ø§Øª
class NoOrdersState extends StatelessWidget {
  final VoidCallback? onShopNow;

  const NoOrdersState({
    super.key,
    this.onShopNow,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.shopping_bag_outlined,
      title: 'ÙØ§ ØªÙØ¬Ø¯ Ø·ÙØ¨Ø§Øª',
      subtitle: 'ÙÙ ØªÙÙ Ø¨Ø¥Ø¬Ø±Ø§Ø¡ Ø£Ù Ø·ÙØ¨Ø§Øª Ø¨Ø¹Ø¯',
      buttonText: 'ØªØ³ÙÙ Ø§ÙØ¢Ù',
      onButtonPressed: onShopNow,
    );
  }
}

/// Ø­Ø§ÙØ© ÙØ§ ØªÙØ¬Ø¯ Ø±Ø³Ø§Ø¦Ù
class NoMessagesState extends StatelessWidget {
  final VoidCallback? onStartChat;

  const NoMessagesState({
    super.key,
    this.onStartChat,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.chat_bubble_outline,
      title: 'ÙØ§ ØªÙØ¬Ø¯ Ø±Ø³Ø§Ø¦Ù',
      subtitle: 'ÙÙ ØªØªÙÙ Ø£Ù Ø±Ø³Ø§Ø¦Ù Ø¨Ø¹Ø¯',
      buttonText: 'Ø¨Ø¯Ø¡ ÙØ­Ø§Ø¯Ø«Ø©',
      onButtonPressed: onStartChat,
    );
  }
}

/// Ø­Ø§ÙØ© Ø®Ø·Ø£
class ErrorState extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const ErrorState({
    super.key,
    this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.error_outline,
      title: 'Ø­Ø¯Ø« Ø®Ø·Ø£',
      subtitle: message ?? 'Ø­Ø¯Ø« Ø®Ø·Ø£ Ø£Ø«ÙØ§Ø¡ ØªØ­ÙÙÙ Ø§ÙØ¨ÙØ§ÙØ§Øª',
      buttonText: 'Ø¥Ø¹Ø§Ø¯Ø© Ø§ÙÙØ­Ø§ÙÙØ©',
      onButtonPressed: onRetry,
    );
  }
}

/// Ø­Ø§ÙØ© ÙØ§ ÙÙØ¬Ø¯ Ø§ØªØµØ§Ù
class NoInternetState extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternetState({
    super.key,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.wifi_off,
      title: 'ÙØ§ ÙÙØ¬Ø¯ Ø§ØªØµØ§Ù',
      subtitle: 'ÙØ±Ø¬Ù Ø§ÙØªØ­ÙÙ ÙÙ Ø§ØªØµØ§ÙÙ Ø¨Ø§ÙØ¥ÙØªØ±ÙØª ÙØ§ÙÙØ­Ø§ÙÙØ© ÙØ±Ø© Ø£Ø®Ø±Ù',
      buttonText: 'Ø¥Ø¹Ø§Ø¯Ø© Ø§ÙÙØ­Ø§ÙÙØ©',
      onButtonPressed: onRetry,
    );
  }
}