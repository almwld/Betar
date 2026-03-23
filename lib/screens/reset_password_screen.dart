import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../services/supabase_service.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  Future<void> _updatePassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await SupabaseService.updateUserProfile({
        'password': _passwordController.text,
      });
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('ØªÙ ØªØºÙÙØ± ÙÙÙØ© Ø§ÙÙØ±ÙØ± Ø¨ÙØ¬Ø§Ø­'),
            backgroundColor: AppTheme.success,
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ø­Ø¯Ø« Ø®Ø·Ø£: $e'),
          backgroundColor: AppTheme.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'ØªØ¹ÙÙÙ ÙÙÙØ© ÙØ±ÙØ± Ø¬Ø¯ÙØ¯Ø©'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Ø£Ø¯Ø®Ù ÙÙÙØ© Ø§ÙÙØ±ÙØ± Ø§ÙØ¬Ø¯ÙØ¯Ø©',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                label: 'ÙÙÙØ© Ø§ÙÙØ±ÙØ± Ø§ÙØ¬Ø¯ÙØ¯Ø©',
                prefixIcon: Icons.lock_outline,
                obscureText: _obscurePassword,
                suffixIcon: _obscurePassword ? Icons.visibility_off : Icons.visibility,
                onSuffixPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                validator: (v) {
                  if (v == null || v.isEmpty) return 'ÙØ·ÙÙØ¨';
                  if (v.length < 6) return '6 Ø£Ø­Ø±Ù Ø¹ÙÙ Ø§ÙØ£ÙÙ';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _confirmController,
                label: 'ØªØ£ÙÙØ¯ ÙÙÙØ© Ø§ÙÙØ±ÙØ±',
                prefixIcon: Icons.lock_outline,
                obscureText: _obscureConfirm,
                suffixIcon: _obscureConfirm ? Icons.visibility_off : Icons.visibility,
                onSuffixPressed: () {
                  setState(() => _obscureConfirm = !_obscureConfirm);
                },
                validator: (v) {
                  if (v == null || v.isEmpty) return 'ÙØ·ÙÙØ¨';
                  if (v != _passwordController.text) return 'ØºÙØ± ÙØªØ·Ø§Ø¨ÙØ©';
                  return null;
                },
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'ØªØ­Ø¯ÙØ« ÙÙÙØ© Ø§ÙÙØ±ÙØ±',
                onPressed: _updatePassword,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}