import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(backgroundColor: AppTheme.goldColor, child: Icon(Icons.person, color: Colors.white)),
            SizedBox(width: 12),
            Text('ÙØ­ÙØ¯ Ø£Ø­ÙØ¯', style: TextStyle(fontFamily: 'Changa')),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) {
                final isMe = index % 2 == 0;
                return Align(
                  alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isMe ? AppTheme.goldColor : AppTheme.getCardColor(context),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      isMe ? 'ÙØ±Ø­Ø¨Ø§ÙØ ÙÙ Ø§ÙÙÙØªØ¬ ÙØªÙÙØ±Ø' : 'ÙØ¹ÙØ Ø§ÙÙÙØªØ¬ ÙØªÙÙØ±',
                      style: TextStyle(fontFamily: 'Changa', color: isMe ? AppTheme.darkText : AppTheme.getTextColor(context)),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.attach_file), onPressed: () {}),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ø§ÙØªØ¨ Ø±Ø³Ø§ÙØªÙ...',
                      filled: true,
                      fillColor: AppTheme.getCardColor(context),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send, color: AppTheme.goldColor), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}