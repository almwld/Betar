import 'dart:io';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user_model.dart';
import '../models/product_model.dart';
import '../models/wallet_model.dart';
import '../models/rating_model.dart';
import '../models/message_model.dart';

class SupabaseService {
  static final SupabaseClient client = Supabase.instance.client;


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

  static Future<void> resetPassword(String email) async {
    try {
      await client.auth.resetPasswordForEmail(email);
    } catch (e) {
      debugPrint('Error resetting password: $e');
      rethrow;
    }
  }

  static Future<void> signOut() async {
    try {
      await client.auth.signOut();
    } catch (e) {
      debugPrint('Error signing out: $e');
      rethrow;
    }
  }

  static User? get currentUser => client.auth.currentUser;

  static bool get isAuthenticated => currentUser != null;


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

  static Future<String?> uploadAvatar(String userId, File file) async {
    try {
      final fileName = 'avatar_$userId${DateTime.now().millisecondsSinceEpoch}.jpg';
      await client.storage.from('avatars').upload(fileName, file);
      
      final url = client.storage.from('avatars').getPublicUrl(fileName);
      
      await updateUserProfile(userId, {'avatar_url': url});
      
      return url;
    } catch (e) {
      debugPrint('Error uploading avatar: $e');
      return null;
    }
  }


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

  static Future<ProductModel?> getProduct(String productId) async {
    try {
      final response = await client
          .from('products')
          .select()
          .eq('id', productId)
          .single();

      await client.rpc('increment_views', params: {'product_id': productId});

      return ProductModel.fromJson(response);
    } catch (e) {
      debugPrint('Error getting product: $e');
      return null;
    }
  }

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


  static Future<WalletModel?> getWallet(String userId) async {
    try {
      final response = await client
          .from('wallets')
          .select()
          .eq('user_id', userId)
          .maybeSingle();

      if (response == null) {
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

  static Future<void> createTransaction(Map<String, dynamic> data) async {
    try {
      await client.from('transactions').insert(data);
    } catch (e) {
      debugPrint('Error creating transaction: $e');
      rethrow;
    }
  }

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

  static Future<void> sendMessage(Map<String, dynamic> data) async {
    try {
      await client.from('messages').insert(data);
    } catch (e) {
      debugPrint('Error sending message: $e');
      rethrow;
    }
  }

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


  static Future<void> addRating(Map<String, dynamic> data) async {
    try {
      await client.from('ratings').insert(data);
    } catch (e) {
      debugPrint('Error adding rating: $e');
      rethrow;
    }
  }

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