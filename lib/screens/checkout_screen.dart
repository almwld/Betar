import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../models/product_model.dart';
import '../services/supabase_service.dart';
import 'order_detail_screen.dart';
import 'login_screen.dart';

class CheckoutItem {
  final ProductModel product;
  final int quantity;
  CheckoutItem({required this.product, required this.quantity});
  double get totalPrice => product.price * quantity;
}

class CheckoutScreen extends StatefulWidget {
  final List<CheckoutItem> items;
  const CheckoutScreen({super.key, required this.items});
  @override State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 0;
  String? _selectedAddress;
  String? _selectedPaymentMethod;
  bool _isProcessing = false;

  double get _subtotal => widget.items.fold(0, (sum, i) => sum + i.totalPrice);
  double get _shipping => 2000;
  double get _total => _subtotal + _shipping;

  Future<void> _processPayment() async {
    if (!SupabaseService.isAuthenticated) {
      _showLoginDialog();
      return;
    }
    setState(() => _isProcessing = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    setState(() => _isProcessing = false);
    final orderId = 'ORD${DateTime.now().millisecondsSinceEpoch}';
    await SupabaseService.createOrder({
      'total_amount': _total,
      'shipping_address': _selectedAddress,
      'payment_method': _selectedPaymentMethod,
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ØªÙ Ø¥ØªÙØ§Ù Ø§ÙØ·ÙØ¨ Ø¨ÙØ¬Ø§Ø­'), backgroundColor: AppTheme.success));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OrderDetailScreen(orderId: orderId)));
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ ÙØ·ÙÙØ¨'),
        content: const Text('ÙØ±Ø¬Ù ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ ÙØ¥ØªÙØ§Ù Ø¹ÙÙÙØ© Ø§ÙØ´Ø±Ø§Ø¡'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Ø¥ÙØºØ§Ø¡')),
          ElevatedButton(onPressed: () { Navigator.pop(context); Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen())); }, child: const Text('ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø¥ØªÙØ§Ù Ø§ÙØ´Ø±Ø§Ø¡'),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: _currentStep < 2
            ? () {
                if (_currentStep == 0 && _selectedAddress == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ø§Ø®ØªØ± Ø¹ÙÙØ§Ù Ø§ÙØªÙØµÙÙ')));
                  return;
                }
                if (_currentStep == 1 && _selectedPaymentMethod == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ø§Ø®ØªØ± Ø·Ø±ÙÙØ© Ø§ÙØ¯ÙØ¹')));
                  return;
                }
                setState(() => _currentStep++);
              }
            : null,
        onStepCancel: _currentStep > 0 ? () => setState(() => _currentStep--) : null,
        steps: [
          Step(
            title: const Text('Ø§ÙØ¹ÙÙØ§Ù'),
            content: Column(
              children: [
                ListTile(
                  title: const Text('ØµÙØ¹Ø§Ø¡ - Ø´Ø§Ø±Ø¹ Ø­Ø¯Ø©'),
                  subtitle: const Text('ÙØ­ÙØ¯ Ø£Ø­ÙØ¯ - 777123456'),
                  trailing: Radio<String>(
                    value: 'ØµÙØ¹Ø§Ø¡ - Ø´Ø§Ø±Ø¹ Ø­Ø¯Ø©',
                    groupValue: _selectedAddress,
                    onChanged: (v) => setState(() => _selectedAddress = v),
                  ),
                  onTap: () => setState(() => _selectedAddress = 'ØµÙØ¹Ø§Ø¡ - Ø´Ø§Ø±Ø¹ Ø­Ø¯Ø©'),
                ),
                ListTile(
                  title: const Text('Ø¹Ø¯Ù - Ø®ÙØ± ÙÙØ³Ø±'),
                  subtitle: const Text('ÙØ­ÙØ¯ Ø£Ø­ÙØ¯ - 777123456'),
                  trailing: Radio<String>(
                    value: 'Ø¹Ø¯Ù - Ø®ÙØ± ÙÙØ³Ø±',
                    groupValue: _selectedAddress,
                    onChanged: (v) => setState(() => _selectedAddress = v),
                  ),
                  onTap: () => setState(() => _selectedAddress = 'Ø¹Ø¯Ù - Ø®ÙØ± ÙÙØ³Ø±'),
                ),
              ],
            ),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: const Text('Ø§ÙØ¯ÙØ¹'),
            content: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet, color: AppTheme.goldColor),
                  title: const Text('Ø§ÙÙØ­ÙØ¸Ø©'),
                  trailing: Radio<String>(
                    value: 'wallet',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (v) => setState(() => _selectedPaymentMethod = v),
                  ),
                  onTap: () => setState(() => _selectedPaymentMethod = 'wallet'),
                ),
                ListTile(
                  leading: const Icon(Icons.credit_card, color: AppTheme.goldColor),
                  title: const Text('Ø¨Ø·Ø§ÙØ© Ø§Ø¦ØªÙØ§Ù'),
                  trailing: Radio<String>(
                    value: 'card',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (v) => setState(() => _selectedPaymentMethod = v),
                  ),
                  onTap: () => setState(() => _selectedPaymentMethod = 'card'),
                ),
              ],
            ),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: const Text('ÙØ±Ø§Ø¬Ø¹Ø©'),
            content: Column(
              children: [
                ...widget.items.map((i) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Container(width: 50, height: 50, color: Colors.grey[300], child: const Icon(Icons.image)),
                      const SizedBox(width: 12),
                      Expanded(child: Text(i.product.title)),
                      Text('${i.totalPrice.toStringAsFixed(0)} Ø±.Ù'),
                    ],
                  ),
                )),
                const Divider(),
                _buildPriceRow('Ø§ÙÙØ¬ÙÙØ¹', _subtotal),
                _buildPriceRow('Ø§ÙØ´Ø­Ù', _shipping),
                const Divider(),
                _buildPriceRow('Ø§ÙØ¥Ø¬ÙØ§ÙÙ', _total, isTotal: true),
              ],
            ),
            isActive: _currentStep >= 2,
          ),
        ],
      ),
      bottomNavigationBar: _currentStep == 2
          ? Container(
              padding: const EdgeInsets.all(16),
              child: CustomButton(text: 'ØªØ£ÙÙØ¯ Ø§ÙØ¯ÙØ¹', onPressed: _processPayment, isLoading: _isProcessing),
            )
          : null,
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: isTotal ? const TextStyle(fontWeight: FontWeight.bold) : null),
          Text('${amount.toStringAsFixed(0)} Ø±.Ù', style: isTotal ? const TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold) : null),
        ],
      ),
    );
  }
}