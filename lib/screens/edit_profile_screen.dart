import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'ÙØ­ÙØ¯ Ø£Ø­ÙØ¯');
  final _emailController = TextEditingController(text: 'mohammed@email.com');
  final _phoneController = TextEditingController(text: '777123456');
  final _addressController = TextEditingController(text: 'ØµÙØ¹Ø§Ø¡ - Ø§ÙÙÙÙ');

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const CustomAppBar(title: 'ØªØ¹Ø¯ÙÙ Ø§ÙÙÙÙ Ø§ÙØ´Ø®ØµÙ'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [AppTheme.goldColor, AppTheme.goldLight],
                        ),
                      ),
                      child: const Icon(Icons.person, size: 60, color: Colors.black),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: AppTheme.goldColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, size: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _nameController,
                label: 'Ø§ÙØ§Ø³Ù Ø§ÙÙØ§ÙÙ',
                prefixIcon: Icons.person_outline,
                validator: (v) => v?.isEmpty ?? true ? 'Ø§ÙØ§Ø³Ù ÙØ·ÙÙØ¨' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                label: 'Ø§ÙØ¨Ø±ÙØ¯ Ø§ÙØ¥ÙÙØªØ±ÙÙÙ',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (v) => v?.isEmpty ?? true ? 'Ø§ÙØ¨Ø±ÙØ¯ ÙØ·ÙÙØ¨' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                label: 'Ø±ÙÙ Ø§ÙÙØ§ØªÙ',
                prefixIcon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (v) => v?.isEmpty ?? true ? 'Ø±ÙÙ Ø§ÙÙØ§ØªÙ ÙØ·ÙÙØ¨' : null,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _addressController,
                label: 'Ø§ÙØ¹ÙÙØ§Ù',
                prefixIcon: Icons.location_on_outlined,
                validator: (v) => v?.isEmpty ?? true ? 'Ø§ÙØ¹ÙÙØ§Ù ÙØ·ÙÙØ¨' : null,
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Ø­ÙØ¸ Ø§ÙØªØºÙÙØ±Ø§Øª',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('ØªÙ ØªØ­Ø¯ÙØ« Ø§ÙÙÙÙ Ø§ÙØ´Ø®ØµÙ')),
                    );
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}