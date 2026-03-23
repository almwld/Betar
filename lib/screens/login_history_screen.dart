import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class LoginHistoryScreen extends StatelessWidget {
  const LoginHistoryScreen({super.key});

  final List<Map<String, dynamic>> _logins = const [
    {'device': 'iPhone 14', 'location': 'ØµÙØ¹Ø§Ø¡', 'time': '2026-03-18 14:30', 'ip': '192.168.1.1'},
    {'device': 'MacBook Pro', 'location': 'ØµÙØ¹Ø§Ø¡', 'time': '2026-03-17 09:15', 'ip': '192.168.1.2'},
    {'device': 'Samsung Galaxy', 'location': 'Ø¹Ø¯Ù', 'time': '2026-03-15 22:40', 'ip': '10.0.0.1'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø³Ø¬Ù Ø§ÙØ¯Ø®ÙÙ'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _logins.length,
        itemBuilder: (ctx, i) {
          final l = _logins[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(
                l['device'].contains('iPhone') ? Icons.phone_iphone :
                l['device'].contains('Mac') ? Icons.computer : Icons.phone_android,
                color: AppTheme.goldColor,
              ),
              title: Text(l['device']),
              subtitle: Text('${l['location']} â¢ ${l['time']}'),
              trailing: Text(l['ip'], style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}