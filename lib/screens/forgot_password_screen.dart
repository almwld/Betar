import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../services/supabase_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;

  Future<void> _sendResetEmail() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await SupabaseService.resetPassword(_emailController.text.trim());
      setState(() => _emailSent = true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ø®Ø·Ø£: $e'), backgroundColor: AppTheme.error),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'ÙØ³ÙØª ÙÙÙØ© Ø§ÙÙØ±ÙØ±'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _emailSent
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mark_email_read, size: 80, color: AppTheme.goldColor),
                  const SizedBox(height: 20),
                  const Text(
                    'ØªÙ Ø¥Ø±Ø³Ø§Ù Ø±Ø§Ø¨Ø· Ø¥Ø¹Ø§Ø¯Ø© Ø§ÙØªØ¹ÙÙÙ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'ÙÙØ¯ Ø£Ø±Ø³ÙÙØ§ Ø±Ø§Ø¨Ø·Ø§Ù Ø¥ÙÙ Ø¨Ø±ÙØ¯Ù Ø§ÙØ¥ÙÙØªØ±ÙÙÙ. ÙØ±Ø¬Ù Ø§ÙØªØ­ÙÙ ÙÙÙ ÙØ§ØªØ¨Ø§Ø¹ Ø§ÙØªØ¹ÙÙÙØ§Øª.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Ø§ÙØ¹ÙØ¯Ø© ÙØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ',
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              )
            : Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Ø£Ø¯Ø®Ù Ø¨Ø±ÙØ¯Ù Ø§ÙØ¥ÙÙØªØ±ÙÙÙ',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _emailController,
                      label: 'Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) {
                        if (v!.isEmpty) return 'ÙØ·ÙÙØ¨';
                        if (!v.contains('@')) return 'Ø¨Ø±ÙØ¯ ØºÙØ± ØµØ­ÙØ­';
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      text: 'Ø¥Ø±Ø³Ø§Ù Ø±Ø§Ø¨Ø· Ø¥Ø¹Ø§Ø¯Ø© Ø§ÙØªØ¹ÙÙÙ',
                      onPressed: _sendResetEmail,
                      isLoading: _isLoading,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}