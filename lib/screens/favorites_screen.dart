import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/simple_app_bar.dart';
import '../../widgets/empty_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasFavorites = false;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const SimpleAppBar(title: 'Ø§ÙÙÙØ¶ÙØ©'),
      body: hasFavorites
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(color: AppTheme.goldColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.favorite, color: AppTheme.goldColor),
                  ),
                  title: Text('ÙÙØªØ¬ ${index + 1}', style: TextStyle(fontFamily: 'Changa', color: AppTheme.getTextColor(context))),
                  subtitle: Text('${(index + 1) * 10000} Ø±.Ù', style: const TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: AppTheme.error),
                    onPressed: () {},
                  ),
                ),
              ),
            )
          : NoFavoritesState(onBrowse: () => Navigator.pushNamed(context, '/all_ads')),
    );
  }
}