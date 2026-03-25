import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../models/product_model.dart';
import '../services/supabase_service.dart';
import 'product_detail_screen.dart';

class ProductsScreen extends StatefulWidget {
  final String? category;
  final String? searchQuery;
  const ProductsScreen({super.key, this.category, this.searchQuery});
  @override State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> _products = [];
  bool _isLoading = true;
  String? _error;
  String _selectedSort = 'Ø§ÙØ£Ø­Ø¯Ø«';
  final List<String> _sortOptions = ['Ø§ÙØ£Ø­Ø¯Ø«', 'Ø§ÙØ³Ø¹Ø±: Ø§ÙØ£ÙÙ', 'Ø§ÙØ³Ø¹Ø±: Ø§ÙØ£Ø¹ÙÙ', 'Ø§ÙØ£Ø¹ÙÙ ØªÙÙÙÙØ§Ù'];
  RangeValues _priceRange = const RangeValues(0, 1000000);
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      _products = await SupabaseService.getProducts(
        category: widget.category,
        searchQuery: widget.searchQuery,
        minPrice: _priceRange.start,
        maxPrice: _priceRange.end,
      );
      _sortProducts(_selectedSort);
    } catch (e) {
      _error = 'Ø­Ø¯Ø« Ø®Ø·Ø£ ÙÙ ØªØ­ÙÙÙ Ø§ÙÙÙØªØ¬Ø§Øª';
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _sortProducts(String option) {
    setState(() {
      _selectedSort = option;
      switch (option) {
        case 'Ø§ÙØ³Ø¹Ø±: Ø§ÙØ£ÙÙ': _products.sort((a, b) => a.price.compareTo(b.price)); break;
        case 'Ø§ÙØ³Ø¹Ø±: Ø§ÙØ£Ø¹ÙÙ': _products.sort((a, b) => b.price.compareTo(a.price)); break;
        case 'Ø§ÙØ£Ø¹ÙÙ ØªÙÙÙÙØ§Ù': _products.sort((a, b) => b.rating.compareTo(a.rating)); break;
        default: _products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: CustomAppBar(title: widget.searchQuery != null ? 'ÙØªØ§Ø¦Ø¬ Ø§ÙØ¨Ø­Ø«' : (widget.category ?? 'Ø§ÙÙÙØªØ¬Ø§Øª')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 80, color: Colors.red[300]),
                      const SizedBox(height: 16),
                      Text(_error!),
                      const SizedBox(height: 16),
                      CustomButton(text: 'Ø¥Ø¹Ø§Ø¯Ø© Ø§ÙÙØ­Ø§ÙÙØ©', onPressed: _loadProducts),
                    ],
                  ),
                )
              : Column(
                  children: [
                    // Ø´Ø±ÙØ· Ø§ÙÙÙØªØ±Ø© ÙØ§ÙØªØ±ØªÙØ¨
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
                        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${_products.length} ÙÙØªØ¬', style: TextStyle(color: Colors.grey[600])),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.filter_list, color: AppTheme.goldColor),
                                onPressed: () => setState(() => _showFilters = !_showFilters),
                              ),
                              DropdownButton<String>(
                                value: _selectedSort,
                                items: _sortOptions.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
                                onChanged: (v) { if (v != null) _sortProducts(v); },
                                underline: Container(),
                                icon: const Icon(Icons.sort),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // ÙÙØ­Ø© Ø§ÙÙÙØ§ØªØ± (Ø¥Ø°Ø§ Ø¸ÙØ±Øª)
                    if (_showFilters)
                      Container(
                        padding: const EdgeInsets.all(16),
                        color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                        child: Column(
                          children: [
                            const Text('ÙØ·Ø§Ù Ø§ÙØ³Ø¹Ø±', style: TextStyle(fontWeight: FontWeight.bold)),
                            RangeSlider(
                              values: _priceRange,
                              min: 0,
                              max: 1000000,
                              divisions: 20,
                              labels: RangeLabels('${_priceRange.start.round()} Ø±.Ù', '${_priceRange.end.round()} Ø±.Ù'),
                              onChanged: (v) => setState(() => _priceRange = v),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(child: CustomButton(text: 'ØªØ·Ø¨ÙÙ', onPressed: _loadProducts)),
                                const SizedBox(width: 12),
                                Expanded(child: CustomButton(text: 'Ø¥ÙØºØ§Ø¡', onPressed: () => setState(() => _showFilters = false), isOutlined: true)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    Expanded(
                      child: _products.isEmpty
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.inventory_2, size: 80, color: Colors.grey[400]),
                                  const SizedBox(height: 16),
                                  const Text('ÙØ§ ØªÙØ¬Ø¯ ÙÙØªØ¬Ø§Øª'),
                                ],
                              ),
                            )
                          : GridView.builder(
                              padding: const EdgeInsets.all(16),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                              itemCount: _products.length,
                              itemBuilder: (_, i) {
                                final p = _products[i];
                                return GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: p))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: AppTheme.goldColor.withOpacity(0.3)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                                                child: CachedNetworkImage(
                                                  imageUrl: p.images.isNotEmpty ? p.images.first : '',
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  placeholder: (_, __) => Container(color: Colors.grey[300]),
                                                  errorWidget: (_, __, ___) => Container(color: Colors.grey[300], child: const Icon(Icons.broken_image)),
                                                ),
                                              ),
                                              if (p.discountPercentage != null)
                                                Positioned(
                                                  top: 8,
                                                  left: 8,
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                                                    child: Text('${p.discountPercentage}%', style: const TextStyle(color: Colors.white, fontSize: 10)),
                                                  ),
                                                ),
                                              if (!p.inStock)
                                                Positioned(
                                                  top: 8,
                                                  right: 8,
                                                  child: Container(
                                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                    decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(12)),
                                                    child: const Text('ØºÙØ± ÙØªÙÙØ±', style: TextStyle(color: Colors.white, fontSize: 10)),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(p.title, style: const TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                                                const SizedBox(height: 4),
                                                Row(
                                                  children: [
                                                    if (p.oldPrice != null)
                                                      Text('${p.oldPrice!.toStringAsFixed(0)} Ø±.Ù', style: const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 10, color: Colors.grey)),
                                                    const SizedBox(width: 4),
                                                    Expanded(child: Text('${p.price.toStringAsFixed(0)} Ø±.Ù', style: const TextStyle(color: AppTheme.goldColor, fontWeight: FontWeight.bold, fontSize: 12))),
                                                  ],
                                                ),
                                                const Spacer(),
                                                Row(
                                                  children: [
                                                    const Icon(Icons.star, size: 12, color: Colors.amber),
                                                    const SizedBox(width: 2),
                                                    Text(p.rating.toStringAsFixed(1), style: const TextStyle(fontSize: 10)),
                                                    const SizedBox(width: 4),
                                                    Text('(${p.reviewCount})', style: const TextStyle(fontSize: 9, color: Colors.grey)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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