import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Ø­ÙÙ ÙØµÙ ÙØ®ØµØµ ÙÙØ­Ø¯
class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final int maxLines;
  final int? maxLength;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onSubmitted;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.maxLength,
    this.autofocus = false,
    this.focusNode,
    this.textInputAction,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      maxLines: maxLines,
      maxLength: maxLength,
      autofocus: autofocus,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      style: const TextStyle(
        fontFamily: 'Changa',
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
      ),
    );
  }
}

/// Ø­ÙÙ ÙØµÙ ÙÙØ¨Ø­Ø«
class SearchTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onClear;
  final String? hint;
  final VoidCallback? onSubmitted;

  const SearchTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onClear,
    this.hint,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? AppTheme.darkDivider : AppTheme.lightDivider,
        ),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: const TextStyle(fontFamily: 'Changa'),
        decoration: InputDecoration(
          hintText: hint ?? 'Ø¨Ø­Ø«...',
          prefixIcon: const Icon(Icons.search, color: AppTheme.goldColor),
          suffixIcon: controller?.text.isNotEmpty == true
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller?.clear();
                    onClear?.call();
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        onSubmitted: (_) => onSubmitted?.call(),
      ),
    );
  }
}

/// Ø­ÙÙ ÙØµÙ ÙÙØ±ÙÙ Ø§ÙÙØ§ØªÙ
class PhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const PhoneTextField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: 'Ø±ÙÙ Ø§ÙÙØ§ØªÙ',
      hint: 'ÙØ«Ø§Ù: 771234567',
      controller: controller,
      keyboardType: TextInputType.phone,
      prefixIcon: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppTheme.goldColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Text(
          '+967',
          style: TextStyle(
            fontFamily: 'Changa',
            color: AppTheme.goldColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}

/// Ø­ÙÙ ÙÙÙØ© Ø§ÙÙØ±ÙØ±
class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const PasswordTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.onChanged,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: widget.label ?? 'ÙÙÙØ© Ø§ÙÙØ±ÙØ±',
      hint: widget.hint ?? 'Ø£Ø¯Ø®Ù ÙÙÙØ© Ø§ÙÙØ±ÙØ±',
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppTheme.goldColor,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}

/// Ø­ÙÙ ÙØµÙ ÙÙÙØµÙ ÙØªØ¹Ø¯Ø¯ Ø§ÙØ£Ø³Ø·Ø±
class DescriptionTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final int maxLines;
  final int? maxLength;

  const DescriptionTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.validator,
    this.maxLines = 4,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: label ?? 'Ø§ÙÙØµÙ',
      hint: hint ?? 'Ø£Ø¯Ø®Ù Ø§ÙÙØµÙ ÙÙØ§...',
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      validator: validator,
    );
  }
}

/// Ø­ÙÙ ÙØµÙ ÙÙØ³Ø¹Ø±
class PriceTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String currency;

  const PriceTextField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.currency = 'YER',
  });

  @override
  Widget build(BuildContext context) {
    final currencySymbol = {
      'YER': 'Ø±.Ù',
      'SAR': 'Ø±.Ø³',
      'USD': '\$',
    }[currency] ?? currency;

    return CustomTextField(
      label: 'Ø§ÙØ³Ø¹Ø±',
      hint: '0.00',
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      prefixIcon: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppTheme.goldColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          currencySymbol,
          style: const TextStyle(
            fontFamily: 'Changa',
            color: AppTheme.goldColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}