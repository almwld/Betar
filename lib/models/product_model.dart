class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? oldPrice;
  final String currency; // YER, SAR, USD
  final List<String> images;
  final String category;
  final String? subCategory;
  final String sellerId;
  final String sellerName;
  final String? sellerAvatar;
  final bool inStock;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final int views;
  final String status; // 'active', 'expired', 'sold'
  final DateTime createdAt;
  final String? city;
  final double? latitude;
  final double? longitude;
  final bool isAuction;
  final DateTime? auctionEndTime;
  final double? currentBid;
  final int? bidCount;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
    this.currency = 'YER',
    required this.images,
    required this.category,
    this.subCategory,
    required this.sellerId,
    required this.sellerName,
    this.sellerAvatar,
    this.inStock = true,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.isFeatured = false,
    this.views = 0,
    this.status = 'active',
    required this.createdAt,
    this.city,
    this.latitude,
    this.longitude,
    this.isAuction = false,
    this.auctionEndTime,
    this.currentBid,
    this.bidCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      oldPrice: json['old_price'] != null
          ? (json['old_price'] as num).toDouble()
          : null,
      currency: json['currency'] ?? 'YER',
      images: List<String>.from(json['images'] ?? []),
      category: json['category'] ?? '',
      subCategory: json['sub_category'],
      sellerId: json['seller_id'] ?? '',
      sellerName: json['seller_name'] ?? '',
      sellerAvatar: json['seller_avatar'],
      inStock: json['in_stock'] ?? true,
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      views: json['views'] ?? 0,
      status: json['status'] ?? 'active',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      city: json['city'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      isAuction: json['is_auction'] ?? false,
      auctionEndTime: json['auction_end_time'] != null
          ? DateTime.parse(json['auction_end_time'])
          : null,
      currentBid: json['current_bid']?.toDouble(),
      bidCount: json['bid_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'old_price': oldPrice,
      'currency': currency,
      'images': images,
      'category': category,
      'sub_category': subCategory,
      'seller_id': sellerId,
      'seller_name': sellerName,
      'seller_avatar': sellerAvatar,
      'in_stock': inStock,
      'rating': rating,
      'review_count': reviewCount,
      'is_featured': isFeatured,
      'views': views,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'is_auction': isAuction,
      'auction_end_time': auctionEndTime?.toIso8601String(),
      'current_bid': currentBid,
      'bid_count': bidCount,
    };
  }

  double get discountPercent {
    if (oldPrice == null || oldPrice == 0) return 0;
    return ((oldPrice! - price) / oldPrice! * 100).roundToDouble();
  }

  bool get hasDiscount => oldPrice != null && oldPrice! > price;

  String get formattedPrice {
    final currencySymbol = {
      'YER': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ±.أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹',
      'SAR': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ±.أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ³',
      'USD': '\$',
    }[currency] ?? currency;
    return '$price $currencySymbol';
  }
}