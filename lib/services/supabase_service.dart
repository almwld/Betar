import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';
import '../models/product_model.dart';
import '../models/wallet_model.dart';
import '../models/rating_model.dart';
import '../models/message_model.dart';

/// Ø®Ø¯ÙØ© Supabase - Ø§ÙØªØ¹Ø§ÙÙ ÙØ¹ ÙØ§Ø¹Ø¯Ø© Ø§ÙØ¨ÙØ§ÙØ§Øª ÙØ§ÙÙØµØ§Ø¯ÙØ©
class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;

  // ==================== Ø§ÙÙØµØ§Ø¯ÙØ© ====================

  /// ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ Ø¨Ø§ÙØ¨Ø±ÙØ¯ ÙÙÙÙØ© Ø§ÙÙØ±ÙØ±
  static Future<AuthResponse> signInWithEmail(String email, String password) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      debugPrint('Error signing in: $e');
      rethrow;
    }
  }

  /// ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ Ø¨Ø±ÙÙ Ø§ÙÙØ§ØªÙ
  static Future<AuthResponse> signInWithPhone(String phone, String password) async {
    try {
      final response = await client.auth.signInWithPassword(
        phone: phone,
        password: password,
      );
      return response;
    } catch (e) {
      debugPrint('Error signing in with phone: $e');
      rethrow;
    }
  }

  /// Ø¥ÙØ´Ø§Ø¡ Ø­Ø³Ø§Ø¨ Ø¬Ø¯ÙØ¯
  static Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
    required String fullName,
    required String phone,
    String userType = 'customer',
    String? city,
  }) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullName,
          'phone': phone,
          'user_type': userType,
          'city': city,
        },
      );
      return response;
    } catch (e) {
      debugPrint('Error signing up: $e');
      rethrow;
    }
  }

  /// Ø¥Ø¹Ø§Ø¯Ø© ØªØ¹ÙÙÙ ÙÙÙØ© Ø§ÙÙØ±ÙØ±
  static Future<void> resetPassword(String email) async {
    try {
      await client.auth.resetPasswordForEmail(email);
    } catch (e) {
      debugPrint('Error resetting password: $e');
      rethrow;
    }
  }

  /// ØªØ³Ø¬ÙÙ Ø§ÙØ®Ø±ÙØ¬
  static Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (e) {
      debugPrint('Error signing out: $e');
      rethrow;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙÙØ³ØªØ®Ø¯Ù Ø§ÙØ­Ø§ÙÙ
  static User? get currentUser => client.auth.currentUser;

  /// Ø§ÙØªØ­ÙÙ ÙÙ Ø­Ø§ÙØ© ØªØ³Ø¬ÙÙ Ø§ÙØ¯Ø®ÙÙ
  static bool get isAuthenticated => currentUser != null;

  // ==================== Ø§ÙÙØ³ØªØ®Ø¯ÙÙÙ ====================

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø¨ÙØ§ÙØ§Øª Ø§ÙÙØ³ØªØ®Ø¯Ù
  static Future<UserModel?> getUserProfile(String userId) async {
    try {
      final response = await client
          .from('profiles')
          .select()
          .eq('id', userId)
          .single();
      
      return UserModel.fromJson(response);
    } catch (e) {
      debugPrint('Error getting user profile: $e');
      return null;
    }
  }

  /// ØªØ­Ø¯ÙØ« Ø¨ÙØ§ÙØ§Øª Ø§ÙÙØ³ØªØ®Ø¯Ù
  static Future<void> updateUserProfile(String userId, Map<String, dynamic> data) async {
    try {
      await client
          .from('profiles')
          .update(data)
          .eq('id', userId);
    } catch (e) {
      debugPrint('Error updating user profile: $e');
      rethrow;
    }
  }

  /// Ø±ÙØ¹ ØµÙØ±Ø© Ø§ÙÙÙÙ Ø§ÙØ´Ø®ØµÙ
  static Future<String?> uploadAvatar(String userId, File file) async {
    try {
      final fileName = 'avatar_$userId${DateTime.now().millisecondsSinceEpoch}.jpg';
      await client.storage.from('avatars').upload(fileName, file);
      
      final url = client.storage.from('avatars').getPublicUrl(fileName);
      
      // ØªØ­Ø¯ÙØ« Ø±Ø§Ø¨Ø· Ø§ÙØµÙØ±Ø© ÙÙ Ø§ÙÙÙÙ Ø§ÙØ´Ø®ØµÙ
      await updateUserProfile(userId, {'avatar_url': url});
      
      return url;
    } catch (e) {
      debugPrint('Error uploading avatar: $e');
      return null;
    }
  }

  // ==================== Ø§ÙÙÙØªØ¬Ø§Øª ====================

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ ÙØ§Ø¦ÙØ© Ø§ÙÙÙØªØ¬Ø§Øª
  static Future<List<ProductModel>> getProducts({
    String? category,
    String? city,
    double? minPrice,
    double? maxPrice,
    String? searchQuery,
    String sortBy = 'created_at',
    bool ascending = false,
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      var query = client.from('products').select();

      if (category != null) {
        query = query.eq('category', category);
      }
      if (city != null) {
        query = query.eq('city', city);
      }
      if (minPrice != null) {
        query = query.gte('price', minPrice);
      }
      if (maxPrice != null) {
        query = query.lte('price', maxPrice);
      }
      if (searchQuery != null && searchQuery.isNotEmpty) {
        query = query.ilike('title', '%$searchQuery%');
      }

      final response = await query
          .order(sortBy, ascending: ascending)
          .range(offset, offset + limit - 1);

      return (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Error getting products: $e');
      return [];
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ ÙÙØªØ¬ ÙØ§Ø­Ø¯
  static Future<ProductModel?> getProduct(String productId) async {
    try {
      final response = await client
          .from('products')
          .select()
          .eq('id', productId)
          .single();

      // Ø²ÙØ§Ø¯Ø© Ø¹Ø¯Ø¯ Ø§ÙÙØ´Ø§ÙØ¯Ø§Øª
      await client.rpc('increment_views', params: {'product_id': productId});

      return ProductModel.fromJson(response);
    } catch (e) {
      debugPrint('Error getting product: $e');
      return null;
    }
  }

  /// Ø¥Ø¶Ø§ÙØ© ÙÙØªØ¬ Ø¬Ø¯ÙØ¯
  static Future<String?> addProduct(Map<String, dynamic> data) async {
    try {
      final response = await client
          .from('products')
          .insert(data)
          .select('id')
          .single();
      
      return response['id'] as String;
    } catch (e) {
      debugPrint('Error adding product: $e');
      return null;
    }
  }

  /// ØªØ­Ø¯ÙØ« ÙÙØªØ¬
  static Future<void> updateProduct(String productId, Map<String, dynamic> data) async {
    try {
      await client
          .from('products')
          .update(data)
          .eq('id', productId);
    } catch (e) {
      debugPrint('Error updating product: $e');
      rethrow;
    }
  }

  /// Ø­Ø°Ù ÙÙØªØ¬
  static Future<void> deleteProduct(String productId) async {
    try {
      await client
          .from('products')
          .delete()
          .eq('id', productId);
    } catch (e) {
      debugPrint('Error deleting product: $e');
      rethrow;
    }
  }

  /// Ø±ÙØ¹ ØµÙØ± Ø§ÙÙÙØªØ¬
  static Future<List<String>> uploadProductImages(String productId, List<File> files) async {
    final List<String> urls = [];
    
    try {
      for (int i = 0; i < files.length; i++) {
        final fileName = 'product_${productId}_${DateTime.now().millisecondsSinceEpoch}_$i.jpg';
        await client.storage.from('products').upload(fileName, files[i]);
        final url = client.storage.from('products').getPublicUrl(fileName);
        urls.add(url);
      }
      return urls;
    } catch (e) {
      debugPrint('Error uploading product images: $e');
      return urls;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ ÙÙØªØ¬Ø§Øª Ø§ÙØ¨Ø§Ø¦Ø¹
  static Future<List<ProductModel>> getSellerProducts(String sellerId) async {
    try {
      final response = await client
          .from('products')
          .select()
          .eq('seller_id', sellerId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Error getting seller products: $e');
      return [];
    }
  }

  // ==================== Ø§ÙÙÙØ¶ÙØ© ====================

  /// Ø¥Ø¶Ø§ÙØ© Ø¥ÙÙ Ø§ÙÙÙØ¶ÙØ©
  static Future<void> addToFavorites(String userId, String productId) async {
    try {
      await client.from('favorites').insert({
        'user_id': userId,
        'product_id': productId,
      });
    } catch (e) {
      debugPrint('Error adding to favorites: $e');
      rethrow;
    }
  }

  /// Ø¥Ø²Ø§ÙØ© ÙÙ Ø§ÙÙÙØ¶ÙØ©
  static Future<void> removeFromFavorites(String userId, String productId) async {
    try {
      await client
          .from('favorites')
          .delete()
          .eq('user_id', userId)
          .eq('product_id', productId);
    } catch (e) {
      debugPrint('Error removing from favorites: $e');
      rethrow;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙÙÙØ¶ÙØ©
  static Future<List<ProductModel>> getFavorites(String userId) async {
    try {
      final response = await client
          .from('favorites')
          .select('products(*)')
          .eq('user_id', userId);

      return (response as List)
          .map((json) => ProductModel.fromJson(json['products']))
          .toList();
    } catch (e) {
      debugPrint('Error getting favorites: $e');
      return [];
    }
  }

  /// Ø§ÙØªØ­ÙÙ ÙÙ ÙØ¬ÙØ¯ ÙÙ Ø§ÙÙÙØ¶ÙØ©
  static Future<bool> isFavorite(String userId, String productId) async {
    try {
      final response = await client
          .from('favorites')
          .select()
          .eq('user_id', userId)
          .eq('product_id', productId)
          .maybeSingle();

      return response != null;
    } catch (e) {
      debugPrint('Error checking favorite: $e');
      return false;
    }
  }

  // ==================== Ø§ÙÙØ­ÙØ¸Ø© ====================

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙÙØ­ÙØ¸Ø©
  static Future<WalletModel?> getWallet(String userId) async {
    try {
      final response = await client
          .from('wallets')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      if (response == null) {
        // Ø¥ÙØ´Ø§Ø¡ ÙØ­ÙØ¸Ø© Ø¬Ø¯ÙØ¯Ø©
        final newWallet = await client
            .from('wallets')
            .insert({'user_id': userId})
            .select()
            .single();
        return WalletModel.fromJson(newWallet);
      }

      return WalletModel.fromJson(response);
    } catch (e) {
      debugPrint('Error getting wallet: $e');
      return null;
    }
  }

  /// ØªØ­Ø¯ÙØ« Ø§ÙØ±ØµÙØ¯
  static Future<void> updateBalance(
    String userId,
    String currency,
    double amount,
  ) async {
    try {
      final column = '${currency.toLowerCase()}_balance';
      await client.rpc(
        'update_balance',
        params: {
          'p_user_id': userId,
          'p_currency': currency,
          'p_amount': amount,
        },
      );
    } catch (e) {
      debugPrint('Error updating balance: $e');
      rethrow;
    }
  }

  /// Ø¥ÙØ´Ø§Ø¡ ÙØ¹Ø§ÙÙØ©
  static Future<void> createTransaction(Map<String, dynamic> data) async {
    try {
      await client.from('transactions').insert(data);
    } catch (e) {
      debugPrint('Error creating transaction: $e');
      rethrow;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙÙØ¹Ø§ÙÙØ§Øª
  static Future<List<TransactionModel>> getTransactions(String userId, {int limit = 50}) async {
    try {
      final response = await client
          .from('transactions')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .limit(limit);

      return (response as List)
          .map((json) => TransactionModel.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Error getting transactions: $e');
      return [];
    }
  }

  // ==================== Ø§ÙØ·ÙØ¨Ø§Øª ====================

  /// Ø¥ÙØ´Ø§Ø¡ Ø·ÙØ¨
  static Future<String?> createOrder(Map<String, dynamic> data) async {
    try {
      final response = await client
          .from('orders')
          .insert(data)
          .select('id')
          .single();
      
      return response['id'] as String;
    } catch (e) {
      debugPrint('Error creating order: $e');
      return null;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø·ÙØ¨Ø§Øª Ø§ÙÙØ³ØªØ®Ø¯Ù
  static Future<List<OrderModel>> getUserOrders(String userId) async {
    try {
      final response = await client
          .from('orders')
          .select('*, items:order_items(*)')
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => OrderModel.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Error getting user orders: $e');
      return [];
    }
  }

  /// ØªØ­Ø¯ÙØ« Ø­Ø§ÙØ© Ø§ÙØ·ÙØ¨
  static Future<void> updateOrderStatus(String orderId, String status) async {
    try {
      await client
          .from('orders')
          .update({'status': status})
          .eq('id', orderId);
    } catch (e) {
      debugPrint('Error updating order status: $e');
      rethrow;
    }
  }

  // ==================== Ø§ÙÙØ­Ø§Ø¯Ø«Ø§Øª ====================

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙÙØ­Ø§Ø¯Ø«Ø§Øª
  static Future<List<ChatModel>> getChats(String userId) async {
    try {
      final response = await client
          .from('chats')
          .select()
          .or('user1_id.eq.$userId,user2_id.eq.$userId')
          .order('updated_at', ascending: false);

      return (response as List)
          .map((json) => ChatModel.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Error getting chats: $e');
      return [];
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙØ±Ø³Ø§Ø¦Ù
  static Future<List<MessageModel>> getMessages(String chatId, {int limit = 50}) async {
    try {
      final response = await client
          .from('messages')
          .select()
          .eq('chat_id', chatId)
          .order('created_at', ascending: false)
          .limit(limit);

      return (response as List)
          .map((json) => MessageModel.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Error getting messages: $e');
      return [];
    }
  }

  /// Ø¥Ø±Ø³Ø§Ù Ø±Ø³Ø§ÙØ©
  static Future<void> sendMessage(Map<String, dynamic> data) async {
    try {
      await client.from('messages').insert(data);
    } catch (e) {
      debugPrint('Error sending message: $e');
      rethrow;
    }
  }

  /// ÙØ¶Ø¹ Ø¹ÙØ§ÙØ© ÙÙØ±ÙØ¡Ø©
  static Future<void> markAsRead(String chatId, String userId) async {
    try {
      await client
          .from('messages')
          .update({'is_read': true})
          .eq('chat_id', chatId)
          .neq('sender_id', userId)
          .eq('is_read', false);
    } catch (e) {
      debugPrint('Error marking as read: $e');
    }
  }

  // ==================== Ø§ÙØªÙÙÙÙØ§Øª ====================

  /// Ø¥Ø¶Ø§ÙØ© ØªÙÙÙÙ
  static Future<void> addRating(Map<String, dynamic> data) async {
    try {
      await client.from('ratings').insert(data);
    } catch (e) {
      debugPrint('Error adding rating: $e');
      rethrow;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ ØªÙÙÙÙØ§Øª Ø§ÙÙÙØªØ¬
  static Future<List<RatingModel>> getProductRatings(String productId) async {
    try {
      final response = await client
          .from('ratings')
          .select()
          .eq('product_id', productId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => RatingModel.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Error getting product ratings: $e');
      return [];
    }
  }

  // ==================== Ø§ÙØ¥Ø´Ø¹Ø§Ø±Ø§Øª ====================

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙØ¥Ø´Ø¹Ø§Ø±Ø§Øª
  static Future<List<NotificationModel>> getNotifications(String userId) async {
    try {
      final response = await client
          .from('notifications')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .limit(50);

      return (response as List)
          .map((json) => NotificationModel.fromJson(json))
          .toList();
    } catch (e) {
      debugPrint('Error getting notifications: $e');
      return [];
    }
  }

  /// ÙØ¶Ø¹ Ø¹ÙØ§ÙØ© ÙÙØ±ÙØ¡Ø© Ø¹ÙÙ Ø§ÙØ¥Ø´Ø¹Ø§Ø±
  static Future<void> markNotificationAsRead(String notificationId) async {
    try {
      await client
          .from('notifications')
          .update({'is_read': true})
          .eq('id', notificationId);
    } catch (e) {
      debugPrint('Error marking notification as read: $e');
    }
  }

  /// Ø§ÙØ§Ø´ØªØ±Ø§Ù ÙÙ ØªØºÙÙØ±Ø§Øª Ø§ÙÙØ³ØªØ®Ø¯Ù
  static void subscribeToUserChanges(String userId, Function callback) {
    client
        .channel('public:profiles:id=eq.$userId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'profiles',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'id',
            value: userId,
          ),
          callback: (payload) => callback(payload),
        )
        .subscribe();
  }

  /// Ø§ÙØ§Ø´ØªØ±Ø§Ù ÙÙ Ø§ÙØ±Ø³Ø§Ø¦Ù Ø§ÙØ¬Ø¯ÙØ¯Ø©
  static void subscribeToMessages(String chatId, Function callback) {
    client
        .channel('public:messages:chat_id=eq.$chatId')
        .onPostgresChanges(
          event: PostgresChangeEvent.insert,
          schema: 'public',
          table: 'messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'chat_id',
            value: chatId,
          ),
          callback: (payload) => callback(payload),
        )
        .subscribe();
  }
}