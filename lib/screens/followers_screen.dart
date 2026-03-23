import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({super.key});

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _followers = [
    {'name': 'Ø£Ø­ÙØ¯ Ø¹ÙÙ', 'avatar': null, 'isFollowing': true},
    {'name': 'ÙØ§Ø·ÙØ© ÙØ­ÙØ¯', 'avatar': null, 'isFollowing': false},
    {'name': 'ÙÙØ³Ù Ø­Ø³ÙÙ', 'avatar': null, 'isFollowing': true},
  ];

  final List<Map<String, dynamic>> _following = [
    {'name': 'ÙØ­ÙØ¯ Ø¹Ø¨Ø¯Ø§ÙÙÙ', 'avatar': null},
    {'name': 'Ø³Ø§Ø±Ø© Ø£Ø­ÙØ¯', 'avatar': null},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ø§ÙÙØªØ§Ø¨Ø¹ÙÙ', style: TextStyle(fontFamily: 'Changa')),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Ø§ÙÙØªØ§Ø¨Ø¹ÙÙ'),
            Tab(text: 'ÙØªØ§Ø¨Ø¹ÙÙ'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildList(_followers, isFollowers: true),
          _buildList(_following, isFollowers: false),
        ],
      ),
    );
  }

  Widget _buildList(List<Map<String, dynamic>> items, {required bool isFollowers}) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (ctx, i) {
        final item = items[i];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.goldColor.withOpacity(0.2),
            child: const Icon(Icons.person, color: AppTheme.goldColor),
          ),
          title: Text(item['name']),
          trailing: isFollowers
              ? (item['isFollowing'] as bool
                  ? OutlinedButton(
                      onPressed: () {},
                      child: const Text('ÙØªØ§Ø¨Ø¹Ù'),
                    )
                  : ElevatedButton(
                      onPressed: () {},
                      child: const Text('ÙØªØ§Ø¨Ø¹Ø©'),
                    ))
              : null,
        );
      },
    );
  }
}