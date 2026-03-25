import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class ConnectedDevicesScreen extends StatelessWidget {
  const ConnectedDevicesScreen({super.key});

  final List<Map<String, dynamic>> devices = const [
    {'name': 'iPhone 14', 'location': 'ØµÙØ¹Ø§Ø¡', 'lastActive': 'Ø§ÙØ¢Ù', 'current': true},
    {'name': 'MacBook Pro', 'location': 'ØµÙØ¹Ø§Ø¡', 'lastActive': 'ÙÙØ° Ø³Ø§Ø¹ØªÙÙ', 'current': false},
    {'name': 'Samsung Galaxy', 'location': 'Ø¹Ø¯Ù', 'lastActive': 'ÙÙØ° 3 Ø£ÙØ§Ù', 'current': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø§ÙØ£Ø¬ÙØ²Ø© Ø§ÙÙØªØµÙØ©'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: devices.length,
        itemBuilder: (ctx, i) {
          final d = devices[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(
                d['name'].contains('iPhone') ? Icons.phone_iphone :
                d['name'].contains('Mac') ? Icons.computer : Icons.phone_android,
                color: AppTheme.goldColor,
              ),
              title: Text(d['name']),
              subtitle: Text('${d['location']} â¢ ${d['lastActive']}'),
              trailing: d['current']
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text('Ø§ÙØ­Ø§ÙÙ', style: TextStyle(color: Colors.green)),
                    )
                  : TextButton(
                      onPressed: () {},
                      child: const Text('ØªØ³Ø¬ÙÙ Ø§ÙØ®Ø±ÙØ¬', style: TextStyle(color: Colors.red)),
                    ),
            ),
          );
        },
      ),
    );
  }
}