import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SupportTicketsScreen extends StatefulWidget {
  const SupportTicketsScreen({super.key});
  @override State<SupportTicketsScreen> createState() => _SupportTicketsScreenState();
}

class _SupportTicketsScreenState extends State<SupportTicketsScreen> {
  final List<Map<String, dynamic>> _tickets = [
    {'id': 'T123', 'subject': 'ÙØ´ÙÙØ© ÙÙ Ø§ÙØ¯ÙØ¹', 'status': 'ÙÙØªÙØ­', 'date': '2026-03-15'},
    {'id': 'T124', 'subject': 'Ø§Ø³ØªÙØ³Ø§Ø± Ø¹Ù ÙÙØªØ¬', 'status': 'ÙØºÙÙ', 'date': '2026-03-10'},
  ];
  bool _showNewTicket = false;
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ø§ÙØ¯Ø¹Ù Ø§ÙÙÙÙ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => setState(() => _showNewTicket = !_showNewTicket),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_showNewTicket)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  CustomTextField(controller: _subjectController, label: 'Ø§ÙÙÙØ¶ÙØ¹'),
                  const SizedBox(height: 12),
                  CustomTextField(controller: _messageController, label: 'Ø§ÙØ±Ø³Ø§ÙØ©', maxLines: 3),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Ø¥Ø±Ø³Ø§Ù',
                          onPressed: () {
                            setState(() {
                              _showNewTicket = false;
                              _subjectController.clear();
                              _messageController.clear();
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('ØªÙ Ø¥Ø±Ø³Ø§Ù ØªØ°ÙØ±ØªÙ Ø¨ÙØ¬Ø§Ø­')),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          text: 'Ø¥ÙØºØ§Ø¡',
                          onPressed: () => setState(() => _showNewTicket = false),
                          isOutlined: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _tickets.length,
              itemBuilder: (_, i) {
                final t = _tickets[i];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: (t['status'] == 'ÙÙØªÙØ­' ? Colors.orange : Colors.green).withOpacity(0.2),
                      child: Icon(Icons.confirmation_number, color: t['status'] == 'ÙÙØªÙØ­' ? Colors.orange : Colors.green),
                    ),
                    title: Text(t['subject']),
                    subtitle: Text('Ø±ÙÙ: ${t['id']} â¢ ${t['date']}'),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: (t['status'] == 'ÙÙØªÙØ­' ? Colors.orange : Colors.green).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        t['status'],
                        style: TextStyle(color: t['status'] == 'ÙÙØªÙØ­' ? Colors.orange : Colors.green),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}