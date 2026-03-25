import 'package:flutter/material.dart';

class Responsive {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Size size(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static bool isMobile(BuildContext context) {
    return width(context) < 600;
  }

  static bool isTablet(BuildContext context) {
    return width(context) >= 600 && width(context) < 1200;
  }

  static static bool isDesktop(BuildContext context) {
    return width(context) >= 1200;
  }

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

  static EdgeInsets getPadding(BuildContext context) {
    if (isDesktop(context)) {
      return const EdgeInsets.symmetric(horizontal: 64);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 32);
    }
    return const EdgeInsets.symmetric(horizontal: 16);
  }

  static int getGridCrossAxisCount(BuildContext context) {
    if (isDesktop(context)) {
      return 4;
    } else if (isTablet(context)) {
      return 3;
    }
    return 2;
  }

  static double getGridChildAspectRatio(BuildContext context) {
    if (isDesktop(context)) {
      return 0.8;
    } else if (isTablet(context)) {
      return 0.75;
    }
    return 0.7;
  }
}

extension ResponsiveExtension on BuildContext {
  double get screenWidth => Responsive.width(this);

  double get screenHeight => Responsive.height(this);

  Size get screenSize => Responsive.size(this);

  bool get isMobile => Responsive.isMobile(this);

  bool get isTablet => Responsive.isTablet(this);

  bool get isDesktop => Responsive.isDesktop(this);

  EdgeInsets get responsivePadding => Responsive.getPadding(this);
}

class AppSizes {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 24;

  static const double iconSm = 16;
  static const double iconMd = 24;
  static const double iconLg = 32;
  static const double iconXl = 48;

  static const double buttonHeight = 52;
  static const double inputHeight = 56;
  static const double appBarHeight = 56;
  static const double bottomNavHeight = 64;
}