/// ÙÙÙØ°Ø¬ Ø§ÙÙØ³ØªØ®Ø¯Ù
class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String phone;
  final String? avatarUrl;
  final String userType; // 'customer' Ø£Ù 'merchant'
  final String? city;
  final double rating;
  final int followers;
  final int following;
  final DateTime createdAt;
  final bool isVerified;

  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.avatarUrl,
    required this.userType,
    this.city,
    this.rating = 0.0,
    this.followers = 0,
    this.following = 0,
    required this.createdAt,
    this.isVerified = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      avatarUrl: json['avatar_url'],
      userType: json['user_type'] ?? 'customer',
      city: json['city'],
      rating: (json['rating'] ?? 0.0).toDouble(),
      followers: json['followers'] ?? 0,
      following: json['following'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      isVerified: json['is_verified'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'avatar_url': avatarUrl,
      'user_type': userType,
      'city': city,
      'rating': rating,
      'followers': followers,
      'following': following,
      'created_at': createdAt.toIso8601String(),
      'is_verified': isVerified,
    };
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? phone,
    String? avatarUrl,
    String? userType,
    String? city,
    double? rating,
    int? followers,
    int? following,
    DateTime? createdAt,
    bool? isVerified,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      userType: userType ?? this.userType,
      city: city ?? this.city,
      rating: rating ?? this.rating,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}