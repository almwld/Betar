import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'package:flex_yemen/models/rating_model.dart';
import '../services/supabase_service.dart';
import 'add_rating_screen.dart';
import 'login_screen.dart';

class ProductRatingsScreen extends StatefulWidget {
  final String productId;
  final String productTitle;
  const ProductRatingsScreen({super.key, required this.productId, required this.productTitle});

  @override
  State<ProductRatingsScreen> createState() => _ProductRatingsScreenState();
}

class _ProductRatingsScreenState extends State<ProductRatingsScreen> {
  List<RatingModel> _ratings = [];
  bool _isLoading = true;
  double _averageRating = 0.0;
  int _totalRatings = 0;
  Map<int, int> _ratingDistribution = {};

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    
    try {
      final ratings = await SupabaseService.getProductRatings(widget.productId);
      final avg = await SupabaseService.getProductAverageRating(widget.productId);
      final total = await SupabaseService.getProductRatingsCount(widget.productId);
      
      Map<int, int> distribution = {};
      for (int i = 1; i <= 5; i++) {
        distribution[i] = ratings.where((r) => r.rating == i).length;
      }

      setState(() {
        _ratings = ratings;
        _averageRating = avg;
        _totalRatings = total;
        _ratingDistribution = distribution;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¹أ‚آ¾أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ‚آ¦أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¹أ‚آ¾ ${widget.productTitle}',
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _navigateToAddRating,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _ratings.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star_border, size: 80, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      const Text('أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ¢آ€آچأکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§ أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¹أ‚آ¾أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ«أ¢آ€آ أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¬أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¯ أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¹أ‚آ¾أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ‚آ¦أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¹أ‚آ¾ أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¨أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¹أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¯', style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      const Text(''),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _navigateToAddRating,
                        icon: const Icon(Icons.add),
                        label: const Text(''),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.goldColor,
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    _averageRating.toStringAsFixed(1),
                                    style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: List.generate(5, (i) {
                                      return Icon(
                                        i < _averageRating.floor() ? Icons.star : 
                                        (i < _averageRating ? Icons.star_half : Icons.star_border),
                                        color: Colors.amber,
                                        size: 20,
                                      );
                                    }),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(''),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: List.generate(5, (index) {
                                    final star = 5 - index;
                                    final count = _ratingDistribution[star] ?? 0;
                                    final percentage = _totalRatings > 0 
                                        ? (count / _totalRatings * 100) 
                                        : 0;
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2),
                                      child: Row(
                                        children: [
                                          Text('$star', style: const TextStyle(fontSize: 12)),
                                          const Icon(Icons.star, size: 12, color: Colors.amber),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: LinearProgressIndicator(
                                              value: percentage / 100,
                                              backgroundColor: Colors.grey[300],
                                              color: AppTheme.goldColor,
                                              minHeight: 6,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text('$count', style: const TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      ..._ratings.map((rating) => _buildRatingCard(rating, isDark)),
                    ],
                  ),
                ),
    );
  }

  Widget _buildRatingCard(RatingModel rating, bool isDark) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: rating.userAvatar != null
                      ? NetworkImage(rating.userAvatar!)
                      : null,
                  backgroundColor: AppTheme.goldColor.withOpacity(0.2),
                  child: rating.userAvatar == null
                      ? Text(rating.userName[0], style: const TextStyle(color: AppTheme.goldColor))
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(rating.userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Row(
                        children: List.generate(5, (i) {
                          return Icon(
                            i < rating.rating ? Icons.star : Icons.star_border,
                            color: Colors.amber,
                            size: 14,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Text(rating.formattedDate, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
              ],
            ),
            if (rating.comment != null && rating.comment!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(rating.comment!),
            ],
            if (rating.images != null && rating.images!.isNotEmpty) ...[
              const SizedBox(height: 8),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: rating.images!.length,
                  itemBuilder: (_, i) {
                    return Container(
                      width: 60,
                      height: 60,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(rating.images![i]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _navigateToAddRating() {
    if (!SupabaseService.isAuthenticated) {
      _showLoginDialog();
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddRatingScreen(
          productId: widget.productId,
          productTitle: widget.productTitle,
          onRatingAdded: _loadData,
        ),
      ),
    );
  }

  void _showLoginDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(''),
        content: const Text(''),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(''),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text(''),
          ),
        ],
      ),
    );
  }
}