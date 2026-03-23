import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ³ÙØ©'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Ø³ÙØªÙ ÙØ§Ø±ØºØ©', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            CustomButton(text: 'ØªØ³ÙÙ Ø§ÙØ¢Ù', onPressed: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}