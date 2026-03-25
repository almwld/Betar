class WalletModel {
  final String id;
  final String userId;
  final double yerBalance;
  final double sarBalance;
  final double usdBalance;
  final DateTime createdAt;
  final DateTime updatedAt;

  WalletModel({
    required this.id,
    required this.userId,
    this.yerBalance = 0.0,
    this.sarBalance = 0.0,
    this.usdBalance = 0.0,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      yerBalance: (json['yer_balance'] ?? 0.0).toDouble(),
      sarBalance: (json['sar_balance'] ?? 0.0).toDouble(),
      usdBalance: (json['usd_balance'] ?? 0.0).toDouble(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'yer_balance': yerBalance,
      'sar_balance': sarBalance,
      'usd_balance': usdBalance,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  double getTotalBalance(String currency) {
    switch (currency) {
      case 'YER':
        return yerBalance;
      case 'SAR':
        return sarBalance;
      case 'USD':
        return usdBalance;
      default:
        return 0.0;
    }
  }

  String getFormattedBalance(String currency) {
    final balance = getTotalBalance(currency);
    final symbol = {
      'YER': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ±.أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹',
      'SAR': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ±.أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ³',
      'USD': '\$',
    }[currency] ?? currency;
    return '${balance.toStringAsFixed(0)} $symbol';
  }
}

class TransactionModel {
  final String id;
  final String userId;
  final String type; // 'deposit', 'withdraw', 'transfer', 'payment', 'refund'
  final double amount;
  final String currency;
  final String description;
  final String status; // 'pending', 'completed', 'failed'
  final DateTime createdAt;
  final String? recipientId;
  final String? recipientName;
  final String? referenceNumber;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.amount,
    required this.currency,
    required this.description,
    required this.status,
    required this.createdAt,
    this.recipientId,
    this.recipientName,
    this.referenceNumber,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'YER',
      description: json['description'] ?? '',
      status: json['status'] ?? 'pending',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      recipientId: json['recipient_id'],
      recipientName: json['recipient_name'],
      referenceNumber: json['reference_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type,
      'amount': amount,
      'currency': currency,
      'description': description,
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'recipient_id': recipientId,
      'recipient_name': recipientName,
      'reference_number': referenceNumber,
    };
  }

  String get typeText {
    final texts = {
      'deposit': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¥أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¯أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¹',
      'withdraw': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ³أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ­أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¨',
      'transfer': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¹أ‚آ¾أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ­أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ«أ¢آ€آ أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ¢آ€آچ',
      'payment': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¯أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¾أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¹',
      'refund': 'أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ³أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¹أ‚آ¾أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ±أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¯أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¯',
    };
    return texts[type] ?? type;
  }

  String get statusText {
    final texts = {
      'pending': 'أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¯ أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ¢آ€آچأکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ‚آ¦أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¹أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ¢آ€آچأکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ¬أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ©',
      'completed': 'أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ‚آ¦أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أکآ¦أ¢آ€آ™أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¹أ‚آ¾أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ‚آ¦أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ¢آ€آچ',
      'failed': 'أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¾أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ§أکآ·أ‚آ£أکآ¹أ‚آ©أکآ·أ‚آ¢أکآ¢أ‚آ´أکآ·أ‚آ£أƒآ¢أ¢آ€آ‍أ‚آ¢أکآ·أ‚آ¢أکآ¸أ‚آ¹أکآ·أ‚آ£أƒآ¢أ¢آ‚آ¬أڑآ‘أکآ·أ‚آ¢أƒآ¢أ¢آ‚آ¬أ¢آ€آچ',
    };
    return texts[status] ?? status;
  }

  bool get isPositive => type == 'deposit' || type == 'refund';
}