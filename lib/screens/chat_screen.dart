import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/empty_state.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasChats = false;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'Ø§ÙØ¯Ø±Ø¯Ø´Ø©'),
      body: hasChats
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(backgroundColor: AppTheme.goldColor, child: Icon(Icons.person, color: Colors.white)),
                  title: Text('ÙØ³ØªØ®Ø¯Ù ${index + 1}', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
                  subtitle: const Text('ÙØ±Ø­Ø¨Ø§ÙØ ÙÙ Ø§ÙÙÙØªØ¬ ÙØªÙÙØ±Ø', style: TextStyle(fontFamily: 'Changa')),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('10:30', style: TextStyle(fontFamily: 'Changa', fontSize: 12, color: AppTheme.getSecondaryTextColor(context))),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(color: AppTheme.goldColor, shape: BoxShape.circle),
                        child: const Text('2', style: TextStyle(fontFamily: 'Changa', color: Colors.white, fontSize: 10)),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.pushNamed(context, '/chat_detail'),
                ),
              ),
            )
          : NoMessagesState(onStartChat: () {}),
    );
  }
}