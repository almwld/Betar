import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../services/supabase_service.dart';
import '../theme/app_theme.dart';

/// Ø´Ø§Ø´Ø© Ø§ÙØªØ±Ø­ÙØ¨
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _controller.forward();
    _navigateToNextScreen();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    // Ø§ÙØªØ­ÙÙ ÙÙ Ø­Ø§ÙØ© ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ
    if (SupabaseService.isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
              isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ø§ÙØ´Ø¹Ø§Ø±
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          gradient: AppTheme.goldGradient,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.goldColor.withOpacity(0.4),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.shopping_bag,
                          size: 80,
                          color: AppTheme.darkText,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              // Ø§Ø³Ù Ø§ÙØªØ·Ø¨ÙÙ
              FadeTransition(
                opacity: _fadeAnimation,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'FLEX',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.goldColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'YEMEN',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.goldLight,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Ø§ÙØ´Ø¹Ø§Ø± Ø§ÙÙØ±Ø¹Ù
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  'ÙÙØµØ© Ø§ÙØªØ¬Ø§Ø±Ø© Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ© Ø§ÙÙÙÙÙØ©',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 16,
                    color: AppTheme.getSecondaryTextColor(context),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              // ÙØ¤Ø´Ø± Ø§ÙØªØ­ÙÙÙ
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppTheme.goldColor),
                strokeWidth: 3,
              ),
            ].animate(
              interval: const Duration(milliseconds: 100),
            ).fadeIn().slideY(
              begin: 0.3,
              end: 0,
              duration: const Duration(milliseconds: 600),
            ),
          ),
        ),
      ),
    );
  }
}