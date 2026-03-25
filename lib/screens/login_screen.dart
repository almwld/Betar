import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../services/supabase_service.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// Ø´Ø§Ø´Ø© ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isGuest = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await SupabaseService.signInWithEmail(
        _emailController.text.trim(),
        _passwordController.text,
      );

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/main');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'ÙØ´Ù ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ: $e',
              style: const TextStyle(fontFamily: 'Changa'),
            ),
            backgroundColor: AppTheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _loginAsGuest() {
    setState(() => _isGuest = true);
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                // Ø§ÙØ´Ø¹Ø§Ø±
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: AppTheme.goldGradient,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.shopping_bag,
                      size: 50,
                      color: AppTheme.darkText,
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(duration: const Duration(milliseconds: 600))
                    .scale(delay: const Duration(milliseconds: 200)),
                const SizedBox(height: 32),
                // Ø¹ÙÙØ§Ù Ø§ÙØªØ±Ø­ÙØ¨
                Text(
                  'ÙØ±Ø­Ø¨Ø§Ù Ø¨Ù',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.getTextColor(context),
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 300))
                    .slideY(begin: 0.2),
                const SizedBox(height: 8),
                Text(
                  'Ø³Ø¬Ù Ø¯Ø®ÙÙ ÙÙÙØªØ§Ø¨Ø¹Ø©',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 16,
                    color: AppTheme.getSecondaryTextColor(context),
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 400)),
                const SizedBox(height: 40),
                // Ø­ÙÙ Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ
                CustomTextField(
                  label: 'Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ Ø£Ù Ø±ÙÙ Ø§ÙÙØ§ØªÙ',
                  hint: 'example@email.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ÙØ±Ø¬Ù Ø¥Ø¯Ø®Ø§Ù Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ';
                    }
                    return null;
                  },
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 500))
                    .slideX(begin: -0.2),
                const SizedBox(height: 20),
                // Ø­ÙÙ ÙÙÙØ© Ø§ÙÙØ±ÙØ±
                PasswordTextField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ÙØ±Ø¬Ù Ø¥Ø¯Ø®Ø§Ù ÙÙÙØ© Ø§ÙÙØ±ÙØ±';
                    }
                    if (value.length < 6) {
                      return 'ÙÙÙØ© Ø§ÙÙØ±ÙØ± ÙØ¬Ø¨ Ø£Ù ØªÙÙÙ 6 Ø£Ø­Ø±Ù Ø¹ÙÙ Ø§ÙØ£ÙÙ';
                    }
                    return null;
                  },
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 600))
                    .slideX(begin: -0.2),
                const SizedBox(height: 12),
                // ÙØ³ÙØª ÙÙÙØ© Ø§ÙÙØ±ÙØ±
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password
                    },
                    child: const Text(
                      'ÙØ³ÙØª ÙÙÙØ© Ø§ÙÙØ±ÙØ±Ø',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: AppTheme.goldColor,
                      ),
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 700)),
                const SizedBox(height: 24),
                // Ø²Ø± ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ
                CustomButton(
                  text: 'ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ',
                  onPressed: _login,
                  isLoading: _isLoading,
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 800))
                    .scale(delay: const Duration(milliseconds: 900)),
                const SizedBox(height: 16),
                // Ø²Ø± Ø§ÙØ¯Ø®ÙÙ ÙØ¶ÙÙ
                CustomButton(
                  text: 'Ø§ÙØ¯Ø®ÙÙ ÙØ¶ÙÙ',
                  onPressed: _loginAsGuest,
                  isOutlined: true,
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 900)),
                const SizedBox(height: 32),
                // Ø®Ø· ÙØ§ØµÙ
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppTheme.getDividerColor(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Ø£Ù',
                        style: TextStyle(
                          fontFamily: 'Changa',
                          color: AppTheme.getSecondaryTextColor(context),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppTheme.getDividerColor(context),
                      ),
                    ),
                  ],
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 1000)),
                const SizedBox(height: 24),
                // Ø±Ø§Ø¨Ø· Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ÙÙØ³ ÙØ¯ÙÙ Ø­Ø³Ø§Ø¨Ø',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: AppTheme.getSecondaryTextColor(context),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨',
                        style: TextStyle(
                          fontFamily: 'Changa',
                          color: AppTheme.goldColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 1100)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}