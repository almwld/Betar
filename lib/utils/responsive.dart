import 'package:flutter/material.dart';

/// Ø£Ø¯ÙØ§Øª Ø§ÙØªØµÙÙÙ Ø§ÙÙØªØ¬Ø§ÙØ¨
class Responsive {
  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø¹Ø±Ø¶ Ø§ÙØ´Ø§Ø´Ø©
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§Ø±ØªÙØ§Ø¹ Ø§ÙØ´Ø§Ø´Ø©
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø­Ø¬Ù Ø§ÙØ´Ø§Ø´Ø©
  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  /// Ø§ÙØªØ­ÙÙ ÙÙ Ø£Ù Ø§ÙØ´Ø§Ø´Ø© ØµØºÙØ±Ø© (ÙØ§ØªÙ)
  static bool isMobile(BuildContext context) {
    return width(context) < 600;
  }

  /// Ø§ÙØªØ­ÙÙ ÙÙ Ø£Ù Ø§ÙØ´Ø§Ø´Ø© ÙØªÙØ³Ø·Ø© (ØªØ§Ø¨ÙØª)
  static bool isTablet(BuildContext context) {
    return width(context) >= 600 && width(context) < 1200;
  }

  /// Ø§ÙØªØ­ÙÙ ÙÙ Ø£Ù Ø§ÙØ´Ø§Ø´Ø© ÙØ¨ÙØ±Ø© (Ø¯ÙØ³ÙØªÙØ¨)
  static static bool isDesktop(BuildContext context) {
    return width(context) >= 1200;
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø­Ø¬Ù ÙÙØ§Ø³Ø¨ Ø­Ø³Ø¨ Ø¹Ø±Ø¶ Ø§ÙØ´Ø§Ø´Ø©
  static double getResponsiveValue({
    required BuildContext context,
    required double mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ padding ÙÙØ§Ø³Ø¨
  static EdgeInsets getPadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 64);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 32);
    }
    return const EdgeInsets.symmetric(horizontal: 16);
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø¹Ø¯Ø¯ Ø§ÙØ£Ø¹ÙØ¯Ø© ÙÙØ´Ø¨ÙØ©
  static int getGridCrossAxisCount(BuildContext context) {
    if (isDesktop(context)) {
      return 4;
    } else if (isTablet(context)) {
      return 3;
    }
    return 2;
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ ÙØ³Ø¨Ø© Ø§ÙØ¹Ø±Ø¶ ÙÙØ§Ø±ØªÙØ§Ø¹ ÙÙØ´Ø¨ÙØ©
  static double getGridChildAspectRatio(BuildContext context) {
    if (isDesktop(context)) {
      return 0.8;
    } else if (isTablet(context)) {
      return 0.75;
    }
    return 0.7;
  }
}

/// Ø§ÙØªØ¯Ø§Ø¯Ø§Øª ÙÙÙ BuildContext
extension ResponsiveExtension on BuildContext {
  /// Ø¹Ø±Ø¶ Ø§ÙØ´Ø§Ø´Ø©
  double get screenWidth => Responsive.width(this);

  /// Ø§Ø±ØªÙØ§Ø¹ Ø§ÙØ´Ø§Ø´Ø©
  double get screenHeight => Responsive.height(this);

  /// Ø­Ø¬Ù Ø§ÙØ´Ø§Ø´Ø©
  Size get screenSize => Responsive.size(this);

  /// ÙÙ Ø§ÙØ´Ø§Ø´Ø© ØµØºÙØ±Ø©
  bool get isMobile => Responsive.isMobile(this);

  /// ÙÙ Ø§ÙØ´Ø§Ø´Ø© ÙØªÙØ³Ø·Ø©
  bool get isTablet => Responsive.isTablet(this);

  /// ÙÙ Ø§ÙØ´Ø§Ø´Ø© ÙØ¨ÙØ±Ø©
  bool get isDesktop => Responsive.isDesktop(this);

  /// padding ÙÙØ§Ø³Ø¨
  EdgeInsets get responsivePadding => Responsive.getPadding(this);
}

/// Ø£Ø­Ø¬Ø§Ù Ø«Ø§Ø¨ØªØ©
class AppSizes {
  // Ø§ÙÙØ³Ø§ÙØ§Øª
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  // ÙØµÙ ÙØ·Ø± Ø§ÙØ²ÙØ§ÙØ§
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 24;

  // Ø§ÙØ£Ø­Ø¬Ø§Ù
  static const double iconSm = 16;
  static const double iconMd = 24;
  static const double iconLg = 32;
  static const double iconXl = 48;

  // Ø§Ø±ØªÙØ§Ø¹Ø§Øª
  static const double buttonHeight = 52;
  static const double inputHeight = 56;
  static const double appBarHeight = 56;
  static const double bottomNavHeight = 64;
}