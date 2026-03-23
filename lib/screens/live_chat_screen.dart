import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LiveChatScreen extends StatefulWidget {
  final String sellerId;
  final String sellerName;
  const LiveChatScreen({super.key, required this.sellerId, required this.sellerName});

  @override
  State<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'sender': 'seller', 'text': 'ÙØ±Ø­Ø¨Ø§ÙØ ÙÙÙ ÙÙÙÙÙÙ ÙØ³Ø§Ø¹Ø¯ØªÙØ', 'time': '10:30 Øµ'},
    {'sender': 'me', 'text': 'ÙÙ Ø§ÙÙÙØªØ¬ ÙØªØ§Ø­Ø', 'time': '10:32 Øµ'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sellerName, style: const TextStyle(fontFamily: 'Changa')),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              reverse: true,
              itemBuilder: (ctx, i) {
                final msg = _messages[_messages.length - 1 - i];
                final isMe = msg['sender'] == 'me';
                return Align(
                  alignment: isMe ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isMe ? AppTheme.goldColor : (isDark ? Colors.grey[800] : Colors.grey[200]),
                      borderRadius: BorderRadius.circular(12).copyWith(
                        bottomLeft: isMe ? const Radius.circular(0) : null,
                        bottomRight: isMe ? null : const Radius.circular(0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(msg['text'], style: TextStyle(color: isMe ? Colors.white : null)),
                        const SizedBox(height: 2),
                        Text(msg['time'], style: TextStyle(fontSize: 10, color: isMe ? Colors.white70 : Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ø§ÙØªØ¨ Ø±Ø³Ø§ÙØªÙ...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: AppTheme.goldColor,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        setState(() {
                          _messages.add({'sender': 'me', 'text': _controller.text, 'time': 'Ø§ÙØ¢Ù'});
                          _controller.clear();
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}