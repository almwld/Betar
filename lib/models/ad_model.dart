import 'package:flutter/material.dart';

class AdModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String currency;
  final List<String> images;
  final String category;
  final String subCategory;
  final String city;
  final String sellerId;
  final String sellerName;
  final double sellerRating;
  final String? sellerPhone;
  final DateTime createdAt;
  final bool isOffer;
  final bool isFeatured;
  final bool isAuction;
  final int? discountPercentage;
  final String? oldPrice;
  final DateTime? auctionEndTime;
  final double? currentBid;
  final int? bidCount;
  final int views;           // Ø¹Ø¯Ø¯ Ø§ÙÙØ´Ø§ÙØ¯Ø§Øª
  final String status;       // Ø­Ø§ÙØ© Ø§ÙØ¥Ø¹ÙØ§Ù (active, sold, expired)

  AdModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.currency,
    required this.images,
    required this.category,
    required this.subCategory,
    required this.city,
    required this.sellerId,
    required this.sellerName,
    required this.sellerRating,
  this.sellerPhone,
    required this.createdAt,
    this.isOffer = false,
    this.isFeatured = false,
    this.isAuction = false,
    this.discountPercentage,
    this.oldPrice,
    this.auctionEndTime,
    this.currentBid,
    this.bidCount,
    this.views = 0,          // Ø§ÙÙÙÙØ© Ø§ÙØ§ÙØªØ±Ø§Ø¶ÙØ©
    this.status = 'active',   // Ø§ÙÙÙÙØ© Ø§ÙØ§ÙØªØ±Ø§Ø¶ÙØ©
  });

  String get formattedPrice {
    if (price >= 1000000) {
      return '${(price / 1000000).toStringAsFixed(1)}M';
    } else if (price >= 1000) {
      return '${(price / 1000).toStringAsFixed(0)}K';
    }
    return price.toStringAsFixed(0);
  }

  String get currencySymbol {
    switch (currency) {
      case 'YER':
        return 'Ø±.Ù';
      case 'SAR':
        return 'Ø±.Ø³';
      case 'USD':
        return '\$';
      default:
        return currency;
    }
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inDays > 365) {
      return 'ÙÙØ° ${difference.inDays ~/ 365} Ø³ÙØ©';
    } else if (difference.inDays > 30) {
      return 'ÙÙØ° ${difference.inDays ~/ 30} Ø´ÙØ±';
    } else if (difference.inDays > 0) {
      return 'ÙÙØ° ${difference.inDays} ÙÙÙ';
    } else if (difference.inHours > 0) {
      return 'ÙÙØ° ${difference.inHours} Ø³Ø§Ø¹Ø©';
    } else if (difference.inMinutes > 0) {
      return 'ÙÙØ° ${difference.inMinutes} Ø¯ÙÙÙØ©';
    } else {
      return 'Ø§ÙØ¢Ù';
    }
  }
}