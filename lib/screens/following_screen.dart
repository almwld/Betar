import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';

class FollowingScreen extends StatelessWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
        appBar: AppBar(
          title: const Text('Ø§ÙÙØªØ§Ø¨Ø¹ÙÙ'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Ø§ÙÙØªØ§Ø¨Ø¹ÙÙ'),
              Tab(text: 'Ø§ÙÙØªØ§Ø¨ÙØ¹ÙÙ'),
            ],
            labelStyle: TextStyle(fontFamily: 'Changa'),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: AppTheme.goldColor,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    'ÙØªØ§Ø¨Ø¹ ${index + 1}',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      color: AppTheme.getTextColor(context),
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.goldColor,
                      foregroundColor: AppTheme.darkTextLight,
                    ),
                    child: const Text(
                      'ÙØªØ§Ø¨Ø¹Ø©',
                      style: TextStyle(fontFamily: 'Changa'),
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: AppTheme.goldColor,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    'ÙØªØ§Ø¨ÙØ¹ ${index + 1}',
                    style: TextStyle(
                      fontFamily: 'Changa',
                      color: AppTheme.getTextColor(context),
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.error,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Ø¥ÙØºØ§Ø¡',
                      style: TextStyle(fontFamily: 'Changa'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}