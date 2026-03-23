import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../services/supabase_service.dart';
import '../services/location_service.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

/// Ø´Ø§Ø´Ø© Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  String? _selectedCity;
  String _userType = 'customer';
  bool _acceptTerms = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'ÙØ±Ø¬Ù Ø§ÙÙÙØ§ÙÙØ© Ø¹ÙÙ Ø§ÙØ´Ø±ÙØ· ÙØ§ÙØ£Ø­ÙØ§Ù',
            style: TextStyle(fontFamily: 'Changa'),
          ),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      await SupabaseService.signUpWithEmail(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        fullName: _nameController.text.trim(),
        phone: _phoneController.text.trim(),
        userType: _userType,
        city: _selectedCity,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'ØªÙ Ø¥ÙØ´Ø§Ø¡ Ø§ÙØ­Ø³Ø§Ø¨ Ø¨ÙØ¬Ø§Ø­! ÙØ±Ø¬Ù ØªÙØ¹ÙÙ Ø¨Ø±ÙØ¯Ù Ø§ÙØ¥ÙÙØªØ±ÙÙÙ',
              style: TextStyle(fontFamily: 'Changa'),
            ),
            backgroundColor: AppTheme.success,
          ),
        );
        Navigator.pushReplacementNamed(context, '/login');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'ÙØ´Ù Ø¥ÙØ´Ø§Ø¡ Ø§ÙØ­Ø³Ø§Ø¨: $e',
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

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cities = LocationService.getCities();

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppTheme.getTextColor(context),
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Ø§ÙØ¹ÙÙØ§Ù
                Text(
                  'Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨ Ø¬Ø¯ÙØ¯',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.getTextColor(context),
                  ),
                )
                    .animate()
                    .fadeIn()
                    .slideX(begin: -0.2),
                const SizedBox(height: 8),
                Text(
                  'Ø£Ø¯Ø®Ù Ø¨ÙØ§ÙØ§ØªÙ ÙØ¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨ Ø¬Ø¯ÙØ¯',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 14,
                    color: AppTheme.getSecondaryTextColor(context),
                  ),
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 100)),
                const SizedBox(height: 32),
                // Ø§ÙØ§Ø³Ù Ø§ÙÙØ§ÙÙ
                CustomTextField(
                  label: 'Ø§ÙØ§Ø³Ù Ø§ÙÙØ§ÙÙ',
                  hint: 'ÙØ­ÙØ¯ Ø£Ø­ÙØ¯',
                  controller: _nameController,
                  prefixIcon: const Icon(Icons.person_outline),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ÙØ±Ø¬Ù Ø¥Ø¯Ø®Ø§Ù Ø§ÙØ§Ø³Ù Ø§ÙÙØ§ÙÙ';
                    }
                    return null;
                  },
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 200)),
                const SizedBox(height: 16),
                // Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ
                CustomTextField(
                  label: 'Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ',
                  hint: 'example@email.com',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ÙØ±Ø¬Ù Ø¥Ø¯Ø®Ø§Ù Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ';
                    }
                    if (!value.contains('@')) {
                      return 'ÙØ±Ø¬Ù Ø¥Ø¯Ø®Ø§Ù Ø¨Ø±ÙØ¯ Ø¥ÙÙØªØ±ÙÙÙ ØµØ­ÙØ­';
                    }
                    return null;
                  },
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 300)),
                const SizedBox(height: 16),
                // Ø±ÙÙ Ø§ÙÙØ§ØªÙ
                PhoneTextField(
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ÙØ±Ø¬Ù Ø¥Ø¯Ø®Ø§Ù Ø±ÙÙ Ø§ÙÙØ§ØªÙ';
                    }
                    if (value.length < 9) {
                      return 'Ø±ÙÙ Ø§ÙÙØ§ØªÙ ØºÙØ± ØµØ­ÙØ­';
                    }
                    return null;
                  },
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 400)),
                const SizedBox(height: 16),
                // ÙÙÙØ© Ø§ÙÙØ±ÙØ±
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
                    .fadeIn(delay: const Duration(milliseconds: 500)),
                const SizedBox(height: 16),
                // ØªØ£ÙÙØ¯ ÙÙÙØ© Ø§ÙÙØ±ÙØ±
                PasswordTextField(
                  label: 'ØªØ£ÙÙØ¯ ÙÙÙØ© Ø§ÙÙØ±ÙØ±',
                  hint: 'Ø£Ø¹Ø¯ Ø¥Ø¯Ø®Ø§Ù ÙÙÙØ© Ø§ÙÙØ±ÙØ±',
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ÙØ±Ø¬Ù ØªØ£ÙÙØ¯ ÙÙÙØ© Ø§ÙÙØ±ÙØ±';
                    }
                    if (value != _passwordController.text) {
                      return 'ÙÙÙØªØ§ Ø§ÙÙØ±ÙØ± ØºÙØ± ÙØªØ·Ø§Ø¨ÙØªÙÙ';
                    }
                    return null;
                  },
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 600)),
                const SizedBox(height: 16),
                // Ø§Ø®ØªÙØ§Ø± Ø§ÙÙØ¯ÙÙØ©
                DropdownButtonFormField<String>(
                  value: _selectedCity,
                  decoration: InputDecoration(
                    labelText: 'Ø§ÙÙØ¯ÙÙØ©',
                    prefixIcon: const Icon(Icons.location_city),
                    filled: true,
                    fillColor: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  items: cities.map((city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(
                        city,
                        style: const TextStyle(fontFamily: 'Changa'),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 700)),
                const SizedBox(height: 16),
                // ÙÙØ¹ Ø§ÙÙØ³ØªØ®Ø¯Ù
                Text(
                  'ÙÙØ¹ Ø§ÙØ­Ø³Ø§Ø¨:',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    fontSize: 14,
                    color: AppTheme.getTextColor(context),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _UserTypeCard(
                        title: 'Ø¹ÙÙÙ',
                        subtitle: 'ÙÙØ´Ø±Ø§Ø¡ ÙØ§ÙØªØµÙØ­',
                        icon: Icons.shopping_bag_outlined,
                        isSelected: _userType == 'customer',
                        onTap: () => setState(() => _userType = 'customer'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _UserTypeCard(
                        title: 'ØªØ§Ø¬Ø±',
                        subtitle: 'ÙÙØ¨ÙØ¹ ÙØ§ÙØªØ³ÙÙÙ',
                        icon: Icons.store_outlined,
                        isSelected: _userType == 'merchant',
                        onTap: () => setState(() => _userType = 'merchant'),
                      ),
                    ),
                  ],
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 800)),
                const SizedBox(height: 16),
                // Ø§ÙÙÙØ§ÙÙØ© Ø¹ÙÙ Ø§ÙØ´Ø±ÙØ·
                CheckboxListTile(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value ?? false;
                    });
                  },
                  title: Row(
                    children: [
                      Text(
                        'Ø£ÙØ§ÙÙ Ø¹ÙÙ ',
                        style: TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 13,
                          color: AppTheme.getTextColor(context),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/privacy_policy');
                        },
                        child: const Text(
                          'Ø§ÙØ´Ø±ÙØ· ÙØ§ÙØ£Ø­ÙØ§Ù',
                          style: TextStyle(
                            fontFamily: 'Changa',
                            fontSize: 13,
                            color: AppTheme.goldColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: AppTheme.goldColor,
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 900)),
                const SizedBox(height: 24),
                // Ø²Ø± Ø¥ÙØ´Ø§Ø¡ Ø§ÙØ­Ø³Ø§Ø¨
                CustomButton(
                  text: 'Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨',
                  onPressed: _register,
                  isLoading: _isLoading,
                )
                    .animate()
                    .fadeIn(delay: const Duration(milliseconds: 1000))
                    .scale(),
                const SizedBox(height: 24),
                // Ø±Ø§Ø¨Ø· ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ÙØ¯ÙÙ Ø­Ø³Ø§Ø¨ Ø¨Ø§ÙÙØ¹ÙØ',
                      style: TextStyle(
                        fontFamily: 'Changa',
                        color: AppTheme.getSecondaryTextColor(context),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ',
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

/// Ø¨Ø·Ø§ÙØ© ÙÙØ¹ Ø§ÙÙØ³ØªØ®Ø¯Ù
class _UserTypeCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _UserTypeCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.goldColor.withOpacity(0.1)
              : (isDark ? AppTheme.darkCard : AppTheme.lightCard),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.goldColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.goldColor : AppTheme.getSecondaryTextColor(context),
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? AppTheme.goldColor : AppTheme.getTextColor(context),
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontFamily: 'Changa',
                fontSize: 11,
                color: AppTheme.getSecondaryTextColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}