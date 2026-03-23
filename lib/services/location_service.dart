import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

/// Ø®Ø¯ÙØ© Ø§ÙÙÙÙØ¹ Ø§ÙØ¬ØºØ±Ø§ÙÙ
class LocationService {
  /// Ø§ÙØªØ­ÙÙ ÙÙ ØµÙØ§Ø­ÙØ§Øª Ø§ÙÙÙÙØ¹
  static Future<bool> checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Ø§ÙØªØ­ÙÙ ÙÙ ØªÙØ¹ÙÙ Ø®Ø¯ÙØ© Ø§ÙÙÙÙØ¹
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      debugPrint('Location services are disabled.');
      return false;
    }

    // Ø§ÙØªØ­ÙÙ ÙÙ ØµÙØ§Ø­ÙØ§Øª Ø§ÙÙÙÙØ¹
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        debugPrint('Location permissions are denied.');
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      debugPrint('Location permissions are permanently denied.');
      return false;
    }

    return true;
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙÙÙÙØ¹ Ø§ÙØ­Ø§ÙÙ
  static Future<Position?> getCurrentLocation() async {
    try {
      final hasPermission = await checkPermission();
      if (!hasPermission) return null;

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      debugPrint('Error getting current location: $e');
      return null;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø¢Ø®Ø± ÙÙÙØ¹ ÙØ¹Ø±ÙÙ
  static Future<Position?> getLastKnownLocation() async {
    try {
      final position = await Geolocator.getLastKnownPosition();
      return position;
    } catch (e) {
      debugPrint('Error getting last known location: $e');
      return null;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙØ¹ÙÙØ§Ù ÙÙ Ø§ÙØ¥Ø­Ø¯Ø§Ø«ÙØ§Øª
  static Future<String?> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isEmpty) return null;

      final placemark = placemarks.first;
      final addressParts = <String>[];

      if (placemark.subLocality?.isNotEmpty == true) {
        addressParts.add(placemark.subLocality!);
      }
      if (placemark.locality?.isNotEmpty == true) {
        addressParts.add(placemark.locality!);
      }
      if (placemark.administrativeArea?.isNotEmpty == true) {
        addressParts.add(placemark.administrativeArea!);
      }

      return addressParts.join(', ');
    } catch (e) {
      debugPrint('Error getting address: $e');
      return null;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙÙØ¯ÙÙØ© ÙÙ Ø§ÙØ¥Ø­Ø¯Ø§Ø«ÙØ§Øª
  static Future<String?> getCityFromLatLng(double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isEmpty) return null;

      return placemarks.first.locality;
    } catch (e) {
      debugPrint('Error getting city: $e');
      return null;
    }
  }

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙØ¥Ø­Ø¯Ø§Ø«ÙØ§Øª ÙÙ Ø§ÙØ¹ÙÙØ§Ù
  static Future<Location?> getLatLngFromAddress(String address) async {
    try {
      final locations = await locationFromAddress(address);
      if (locations.isEmpty) return null;

      return locations.first;
    } catch (e) {
      debugPrint('Error getting coordinates from address: $e');
      return null;
    }
  }

  /// ÙØªØ§Ø¨Ø¹Ø© ØªØºÙÙØ±Ø§Øª Ø§ÙÙÙÙØ¹
  static Stream<Position>? getLocationStream() {
    try {
      return Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100, // ØªØ­Ø¯ÙØ« ÙÙ 100 ÙØªØ±
        ),
      );
    } catch (e) {
      debugPrint('Error getting location stream: $e');
      return null;
    }
  }

  /// Ø­Ø³Ø§Ø¨ Ø§ÙÙØ³Ø§ÙØ© Ø¨ÙÙ ÙÙØ·ØªÙÙ
  static double calculateDistance(
    double startLatitude,
    double startLongitude,
    double endLatitude,
    double endLongitude,
  ) {
    return Geolocator.distanceBetween(
      startLatitude,
      startLongitude,
      endLatitude,
      endLongitude,
    );
  }

  /// ÙØªØ­ Ø¥Ø¹Ø¯Ø§Ø¯Ø§Øª Ø§ÙÙÙÙØ¹
  static Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  /// ÙØªØ­ Ø¥Ø¹Ø¯Ø§Ø¯Ø§Øª Ø§ÙØªØ·Ø¨ÙÙ
  static Future<bool> openAppSettings() async {
    return await Geolocator.openAppSettings();
  }

  /// ÙØ§Ø¦ÙØ© Ø§ÙÙØ¯Ù Ø§ÙÙÙÙÙØ© Ø§ÙØ±Ø¦ÙØ³ÙØ©
  static const List<String> yemeniCities = [
    'ØµÙØ¹Ø§Ø¡',
    'Ø¹Ø¯Ù',
    'ØªØ¹Ø²',
    'Ø§ÙØ­Ø¯ÙØ¯Ø©',
    'Ø§ÙÙÙÙØ§',
    'Ø¥Ø¨',
    'Ø°ÙØ§Ø±',
    'Ø§ÙØ¨ÙØ¶Ø§Ø¡',
    'Ø³ÙØ¦ÙÙ',
    'Ø²Ø¨ÙØ¯',
    'Ø±ÙÙØ©',
    'Ø¹ÙØ±Ø§Ù',
    'Ø­Ø¬Ø©',
    'ØµØ¹Ø¯Ø©',
    'Ø§ÙÙØ­ÙÙØª',
    'ÙØ­Ø¬',
    'Ø£Ø¨ÙÙ',
    'Ø´Ø¨ÙØ©',
    'Ø§ÙÙÙØ±Ø©',
    'Ø³ÙØ·Ø±Ù',
    'Ø§ÙØ¬ÙÙ',
    'ÙØ£Ø±Ø¨',
    'Ø§ÙØ¶Ø§ÙØ¹',
    'Ø­Ø¶Ø±ÙÙØª',
  ];

  /// Ø§ÙØ­ØµÙÙ Ø¹ÙÙ Ø§ÙÙØ¯Ù
  static List<String> getCities() {
    return yemeniCities;
  }

  /// Ø§ÙØ¨Ø­Ø« ÙÙ Ø§ÙÙØ¯Ù
  static List<String> searchCities(String query) {
    if (query.isEmpty) return yemeniCities;
    
    return yemeniCities
        .where((city) => city.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}