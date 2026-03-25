import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';

/// Ø¨Ø·Ø§ÙØ© Ø§ÙØ¥Ø¹ÙØ§Ù/Ø§ÙÙÙØªØ¬
class AdCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;
  final bool showFavorite;

  const AdCard({
    super.key,
    required this.product,
    this.onTap,
    this.onFavoriteTap,
    this.showFavorite = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ØµÙØ±Ø© Ø§ÙÙÙØªØ¬
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.images.isNotEmpty
                        ? product.images.first
                        : 'https://via.placeholder.com/300x200',
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 150,
                      color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.goldColor),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 150,
                      color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: AppTheme.goldColor,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                // Ø´Ø§Ø±Ø© Ø§ÙØ®ØµÙ
                if (product.hasDiscount)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.error,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '-${product.discountPercent.toInt()}%',
                        style: const TextStyle(
                          fontFamily: 'Changa',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                // Ø´Ø§Ø±Ø© Ø§ÙÙØ²Ø§Ø¯
                if (product.isAuction)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.goldColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.gavel,
                            color: AppTheme.darkText,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'ÙØ²Ø§Ø¯',
                            style: TextStyle(
                              fontFamily: 'Changa',
                              color: AppTheme.darkText,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                // Ø²Ø± Ø§ÙÙÙØ¶ÙØ©
                if (showFavorite)
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: GestureDetector(
                      onTap: onFavoriteTap,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            // ÙØ¹ÙÙÙØ§Øª Ø§ÙÙÙØªØ¬
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ø§ÙØ¹ÙÙØ§Ù
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Changa',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.getTextColor(context),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Ø§ÙØ³Ø¹Ø±
                  Row(
                    children: [
                      Text(
                        product.formattedPrice,
                        style: const TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.goldColor,
                        ),
                      ),
                      if (product.hasDiscount) ...[
                        const SizedBox(width: 8),
                        Text(
                          '${product.oldPrice}',
                          style: TextStyle(
                            fontFamily: 'Changa',
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: AppTheme.getSecondaryTextColor(context),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 8),
                  // ÙØ¹ÙÙÙØ§Øª Ø¥Ø¶Ø§ÙÙØ©
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppTheme.getSecondaryTextColor(context),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          product.city ?? 'ØºÙØ± ÙØ­Ø¯Ø¯',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Changa',
                            fontSize: 12,
                            color: AppTheme.getSecondaryTextColor(context),
                          ),
                        ),
                      ),
                      // Ø§ÙØªÙÙÙÙ
                      if (product.rating > 0) ...[
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: AppTheme.goldColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          product.rating.toStringAsFixed(1),
                          style: TextStyle(
                            fontFamily: 'Changa',
                            fontSize: 12,
                            color: AppTheme.getTextColor(context),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Ø¨Ø·Ø§ÙØ© Ø§ÙÙÙØªØ¬ Ø§ÙØ£ÙÙÙ (ÙÙÙÙØ§Ø¦Ù)
class AdCardHorizontal extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const AdCardHorizontal({
    super.key,
    required this.product,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Ø§ÙØµÙØ±Ø©
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: product.images.isNotEmpty
                    ? product.images.first
                    : 'https://via.placeholder.com/120',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 120,
                  height: 120,
                  color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
                  child: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppTheme.goldColor),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 120,
                  height: 120,
                  color: isDark ? AppTheme.darkSurface : AppTheme.lightSurface,
                  child: const Icon(
                    Icons.image_not_supported,
                    color: AppTheme.goldColor,
                  ),
                ),
              ),
            ),
            // Ø§ÙÙØ¹ÙÙÙØ§Øª
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.getTextColor(context),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.formattedPrice,
                      style: const TextStyle(
                        fontFamily: 'Changa',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.goldColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor(product.status).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            _getStatusText(product.status),
                            style: TextStyle(
                              fontFamily: 'Changa',
                              fontSize: 11,
                              color: _getStatusColor(product.status),
                            ),
                          ),
                        ),
                        const Spacer(),
                        if (onDelete != null)
                          IconButton(
                            icon: const Icon(
                              Icons.delete_outline,
                              color: AppTheme.error,
                              size: 20,
                            ),
                            onPressed: onDelete,
                          ),
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
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'active':
        return AppTheme.success;
      case 'sold':
        return AppTheme.info;
      case 'expired':
        return AppTheme.error;
      default:
        return AppTheme.goldColor;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'active':
        return 'ÙØ´Ø·';
      case 'sold':
        return 'ØªÙ Ø§ÙØ¨ÙØ¹';
      case 'expired':
        return 'ÙÙØªÙÙ';
      default:
        return 'ØºÙØ± ÙØ¹Ø±ÙÙ';
    }
  }
}