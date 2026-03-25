import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/ad_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/empty_state.dart';

/// Ø§ÙØµÙØ­Ø© Ø§ÙØ±Ø¦ÙØ³ÙØ©
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlide = 0;
  bool _isLoading = true;
  List<ProductModel> _featuredProducts = [];
  List<ProductModel> _auctionProducts = [];
  List<ProductModel> _newProducts = [];

  // Ø¨ÙØ§ÙØ§Øª ÙÙÙÙØ© ÙÙØ³ÙØ§ÙØ¯Ø±
  final List<Map<String, dynamic>> _slides = [
    {
      'title': 'Ø¥Ø¹ÙØ§ÙØ§Øª Ø­ØµØ±ÙØ© ÙÙØªØ¬Ø§Ø±',
      'subtitle': 'Ø§ÙØ¶Ù Ø¥ÙÙÙØ§ ÙÙÙ Ø¨Ø¹Ø±Ø¶ ÙÙØªØ¬Ø§ØªÙ',
      'color': const Color(0xFF6C63FF),
      'icon': Icons.store,
    },
    {
      'title': 'VIP Ø¹Ø±ÙØ¶',
      'subtitle': 'Ø®ØµÙÙØ§Øª Ø­ØµØ±ÙØ© ØªØµÙ Ø¥ÙÙ 50%',
      'color': const Color(0xFFFF6B6B),
      'icon': Icons.local_offer,
    },
    {
      'title': 'Ø¹Ø±ÙØ¶ Ø£ÙØ¶Ù Ø§ÙÙØ·Ø§Ø¹Ù',
      'subtitle': 'Ø§ÙØªØ´Ù Ø£Ø´ÙÙ Ø§ÙØ£Ø·Ø¨Ø§Ù',
      'color': const Color(0xFF4ECDC4),
      'icon': Icons.restaurant,
    },
    {
      'title': 'ÙØ²Ø§Ø¯Ø§Øª Ø§ÙØ³ÙØ§Ø±Ø§Øª ÙØ§ÙØ¹ÙØ§Ø±Ø§Øª',
      'subtitle': 'ÙØ±Øµ Ø§Ø³ØªØ«ÙØ§Ø±ÙØ© ÙØ±ÙØ¯Ø©',
      'color': const Color(0xFFFFE66D),
      'icon': Icons.gavel,
    },
    {
      'title': 'Ø¥Ø¹ÙØ§ÙØ§Øª Ø§ÙÙÙØµØ©',
      'subtitle': 'ØªØ§Ø¨Ø¹ Ø£Ø­Ø¯Ø« Ø§ÙØ£Ø®Ø¨Ø§Ø± ÙØ§ÙØªØ­Ø¯ÙØ«Ø§Øª',
      'color': const Color(0xFF95E1D3),
      'icon': Icons.campaign,
    },
  ];

  // Ø¨ÙØ§ÙØ§Øª "ÙØ²ÙØ¯ ÙÙ ÙØ§ ØªØ±ÙØ¯"
  final List<Map<String, dynamic>> _quickCategories = [
    {'name': 'ÙØ¹ÙÙØ§Øª', 'icon': Icons.school, 'color': const Color(0xFF6C63FF)},
    {'name': 'Ø¹ÙØ§Ø±Ø§Øª', 'icon': Icons.apartment, 'color': const Color(0xFF4ECDC4)},
    {'name': 'Ø³ÙØ±', 'icon': Icons.flight, 'color': const Color(0xFFFF6B6B)},
    {'name': 'Ø´Ø­Ù', 'icon': Icons.local_shipping, 'color': const Color(0xFFFFE66D)},
    {'name': 'Ø£ÙØ¹Ø§Ø¨', 'icon': Icons.sports_esports, 'color': const Color(0xFF95E1D3)},
  ];

  // Ø¨ÙØ§ÙØ§Øª Ø§ÙØ¹ÙØ§Ø±Ø§Øª ÙØ§ÙØ§Ø³ØªØ«ÙØ§Ø±Ø§Øª
  final List<Map<String, dynamic>> _realEstateCategories = [
    {'name': 'Ø´ÙÙ Ø§ÙØ¥ÙØ¬Ø§Ø±', 'icon': Icons.apartment, 'color': const Color(0xFF3498DB)},
    {'name': 'ÙÙÙ Ø§ÙØ¨ÙØ¹', 'icon': Icons.villa, 'color': const Color(0xFF2ECC71)},
    {'name': 'Ø£Ø±Ø§Ø¶Ù', 'icon': Icons.terrain, 'color': const Color(0xFFE67E22)},
    {'name': 'ÙÙØ§ÙØ¢Øª', 'icon': Icons.card_giftcard, 'color': const Color(0xFF9B59B6)},
    {'name': 'ÙØ­Ø·Ø§Øª', 'icon': Icons.local_gas_station, 'color': const Color(0xFF1ABC9C)},
    {'name': 'ÙÙØ§ÙÙØ§Øª', 'icon': Icons.construction, 'color': const Color(0xFFE74C3C)},
    {'name': 'Ø¯ÙÙÙØ±', 'icon': Icons.design_services, 'color': const Color(0xFF34495E)},
  ];

  // Ø¨ÙØ§ÙØ§Øª Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ§Øª
  final List<Map<String, dynamic>> _techCategories = [
    {'name': 'ÙÙØ§ØªÙ Ø°ÙÙØ©', 'icon': Icons.smartphone, 'color': const Color(0xFF9B59B6)},
    {'name': 'ÙØ§Ø¨ØªÙØ¨', 'icon': Icons.laptop, 'color': const Color(0xFF3498DB)},
    {'name': 'Ø³ØªØ§Ø±ÙÙÙÙ', 'icon': Icons.wifi, 'color': const Color(0xFF2ECC71)},
    {'name': 'ÙØ§ÙÙØ±Ø§Øª', 'icon': Icons.camera_alt, 'color': const Color(0xFFE74C3C)},
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // ÙØ­Ø§ÙØ§Ø© ØªØ­ÙÙÙ Ø§ÙØ¨ÙØ§ÙØ§Øª
    await Future.delayed(const Duration(seconds: 1));
    
    setState(() {
      _featuredProducts = _getDummyProducts();
      _auctionProducts = _getDummyAuctionProducts();
      _newProducts = _getDummyProducts().take(4).toList();
      _isLoading = false;
    });
  }

  List<ProductModel> _getDummyProducts() {
    return [
      ProductModel(
        id: '1',
        title: 'Ø¢ÙÙÙÙ 15 Ø¨Ø±Ù ÙØ§ÙØ³ 256GB',
        description: 'ÙØ§ØªÙ Ø£ÙÙÙÙ Ø¬Ø¯ÙØ¯ Ø¨Ø§ÙÙØ§ÙÙ ÙØ¹ Ø¶ÙØ§Ù Ø³ÙØ©',
        price: 450000,
        oldPrice: 500000,
        currency: 'YER',
        images: ['https://via.placeholder.com/300x200/6C63FF/FFFFFF?text=iPhone+15'],
        category: 'Ø¥ÙÙØªØ±ÙÙÙØ§Øª',
        sellerId: 'seller1',
        sellerName: 'ÙØªØ¬Ø± Ø§ÙØªÙÙÙØ©',
        rating: 4.8,
        reviewCount: 120,
        city: 'ØµÙØ¹Ø§Ø¡',
        createdAt: DateTime.now(),
      ),
      ProductModel(
        id: '2',
        title: 'ÙØ§Ø¨ØªÙØ¨ Dell XPS 15',
        description: 'ÙØ§Ø¨ØªÙØ¨ Ø§Ø­ØªØ±Ø§ÙÙ ÙÙØ£Ø¹ÙØ§Ù ÙØ§ÙØªØµÙÙÙ',
        price: 380000,
        currency: 'YER',
        images: ['https://via.placeholder.com/300x200/4ECDC4/FFFFFF?text=Dell+XPS'],
        category: 'Ø¥ÙÙØªØ±ÙÙÙØ§Øª',
        sellerId: 'seller2',
        sellerName: 'Ø§ÙØ­Ø§Ø³ÙØ¨ Ø§ÙÙØªÙØ¯Ù',
        rating: 4.5,
        reviewCount: 85,
        city: 'Ø¹Ø¯Ù',
        createdAt: DateTime.now(),
      ),
      ProductModel(
        id: '3',
        title: 'Ø³ÙØ§Ø±Ø© ØªÙÙÙØªØ§ ÙØ§ÙØ±Ù 2020',
        description: 'Ø³ÙØ§Ø±Ø© ÙØ¸ÙÙØ© Ø¬Ø¯Ø§ÙØ ÙÙØ´Ù ÙÙÙÙ',
        price: 8500000,
        currency: 'YER',
        images: ['https://via.placeholder.com/300x200/FF6B6B/FFFFFF?text=Toyota'],
        category: 'Ø³ÙØ§Ø±Ø§Øª',
        sellerId: 'seller3',
        sellerName: 'ÙØ¹Ø±Ø¶ Ø§ÙØ³ÙØ§Ø±Ø§Øª',
        rating: 4.9,
        reviewCount: 45,
        city: 'ØªØ¹Ø²',
        createdAt: DateTime.now(),
      ),
      ProductModel(
        id: '4',
        title: 'Ø´ÙØ© ÙØ§Ø®Ø±Ø© ÙÙØ¥ÙØ¬Ø§Ø±',
        description: '3 ØºØ±ÙØ 2 Ø­ÙØ§ÙØ ØµØ§ÙØ© ÙØ¨ÙØ±Ø©',
        price: 80000,
        currency: 'YER',
        images: ['https://via.placeholder.com/300x200/FFE66D/333333?text=Apartment'],
        category: 'Ø¹ÙØ§Ø±Ø§Øª',
        sellerId: 'seller4',
        sellerName: 'Ø§ÙØ¹ÙØ§Ø±Ø§Øª Ø§ÙØ°ÙØ¨ÙØ©',
        rating: 4.6,
        reviewCount: 30,
        city: 'ØµÙØ¹Ø§Ø¡',
        createdAt: DateTime.now(),
      ),
    ];
  }

  List<ProductModel> _getDummyAuctionProducts() {
    return [
      ProductModel(
        id: 'a1',
        title: 'Ø¬ÙØ¯ÙØ© ØµÙÙØ§ÙÙ ÙØ¯ÙÙØ©',
        description: 'Ø¬ÙØ¯ÙØ© Ø£Ø«Ø±ÙØ© ÙØ§Ø¯Ø±Ø©',
        price: 150000,
        currency: 'YER',
        images: ['https://via.placeholder.com/300x200/D4AF37/FFFFFF?text=Dagger'],
        category: 'ØªØ­Ù',
        sellerId: 'seller5',
        sellerName: 'ØµØ§Ø­Ø¨ Ø§ÙØªØ­Ù',
        rating: 5.0,
        reviewCount: 15,
        city: 'ØµÙØ¹Ø§Ø¡',
        createdAt: DateTime.now(),
        isAuction: true,
        auctionEndTime: DateTime.now().add(const Duration(days: 2)),
        currentBid: 150000,
        bidCount: 8,
      ),
      ProductModel(
        id: 'a2',
        title: 'Ø³Ø§Ø¹Ø© Ø±ÙÙÙØ³ Ø£ØµÙÙØ©',
        description: 'Ø³Ø§Ø¹Ø© ÙØ§Ø®Ø±Ø© Ø¨Ø­Ø§ÙØ© ÙÙØªØ§Ø²Ø©',
        price: 2500000,
        currency: 'YER',
        images: ['https://via.placeholder.com/300x200/FFD700/333333?text=Rolex'],
        category: 'Ø³Ø§Ø¹Ø§Øª',
        sellerId: 'seller6',
        sellerName: 'Ø§ÙØ³Ø§Ø¹Ø§Øª Ø§ÙÙØ§Ø®Ø±Ø©',
        rating: 4.9,
        reviewCount: 50,
        city: 'Ø¹Ø¯Ù',
        createdAt: DateTime.now(),
        isAuction: true,
        auctionEndTime: DateTime.now().add(const Duration(hours: 12)),
        currentBid: 2500000,
        bidCount: 23,
      ),
      ProductModel(
        id: 'a3',
        title: 'Ø³Ø¬Ø§Ø¯Ø© ÙØ¯ÙÙØ© ÙØ§Ø±Ø³ÙØ©',
        description: 'Ø³Ø¬Ø§Ø¯Ø© ØµÙÙ ÙØ¯ÙÙØ© Ø§ÙØµÙØ¹',
        price: 450000,
        currency: 'YER',
        images: ['https://via.placeholder.com/300x200/8B4513/FFFFFF?text=Carpet'],
        category: 'Ø³Ø¬Ø§Ø¯',
        sellerId: 'seller7',
        sellerName: 'Ø³Ø¬Ø§Ø¯ Ø§ÙØ´Ø±Ù',
        rating: 4.7,
        reviewCount: 22,
        city: 'ØªØ¹Ø²',
        createdAt: DateTime.now(),
        isAuction: true,
        auctionEndTime: DateTime.now().add(const Duration(days: 3)),
        currentBid: 450000,
        bidCount: 5,
      ),
      ProductModel(
        id: 'a4',
        title: 'ÙÙØ­Ø© ÙÙÙØ© ÙØ§Ø¯Ø±Ø©',
        description: 'ÙÙØ­Ø© Ø²ÙØª Ø£ØµÙÙØ© ÙÙÙÙØ§Ù...',
        price: 1200000,
        currency: 'YER',
        images: ['https://via.placeholder.com/300x200/FF6347/FFFFFF?text=Painting'],
        category: 'ÙÙÙÙ',
        sellerId: 'seller8',
        sellerName: 'ÙØ¹Ø±Ø¶ Ø§ÙÙÙÙÙ',
        rating: 5.0,
        reviewCount: 10,
        city: 'ØµÙØ¹Ø§Ø¡',
        createdAt: DateTime.now(),
        isAuction: true,
        auctionEndTime: DateTime.now().add(const Duration(days: 1)),
        currentBid: 1200000,
        bidCount: 12,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(showLogo: true),
      body: _isLoading
          ? const LoadingWidget(message: 'Ø¬Ø§Ø±Ù Ø§ÙØªØ­ÙÙÙ...')
          : CustomRefreshIndicator(
              onRefresh: _loadData,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ø§ÙØ³ÙØ§ÙØ¯Ø±
                    _buildCarousel(),
                    const SizedBox(height: 24),
                    // ÙØ²ÙØ¯ ÙÙ ÙØ§ ØªØ±ÙØ¯
                    _buildQuickCategories(),
                    const SizedBox(height: 24),
                    // ÙØ²Ø§Ø¯ Ø§ÙØ¬ÙØ§Ø¨Ù
                    _buildAuctionSection(),
                    const SizedBox(height: 24),
                    // Ø§ÙØ¹ÙØ§Ø±Ø§Øª ÙØ§ÙØ§Ø³ØªØ«ÙØ§Ø±Ø§Øª
                    _buildRealEstateSection(),
                    const SizedBox(height: 24),
                    // Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ§Øª ÙØ§ÙØªÙÙÙØ©
                    _buildTechSection(),
                    const SizedBox(height: 24),
                    // Ø§ÙÙÙØªØ¬Ø§Øª Ø§ÙÙÙÙØ²Ø©
                    _buildFeaturedProducts(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildCarousel() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
            },
          ),
          items: _slides.map((slide) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        slide['color'],
                        slide['color'].withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: -20,
                        bottom: -20,
                        child: Icon(
                          slide['icon'],
                          size: 150,
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              slide['title'],
                              style: const TextStyle(
                                fontFamily: 'Changa',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              slide['subtitle'],
                              style: TextStyle(
                                fontFamily: 'Changa',
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        // ÙØ¤Ø´Ø±Ø§Øª Ø§ÙØ³ÙØ§ÙØ¯Ø±
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _slides.asMap().entries.map((entry) {
            return Container(
              width: _currentSlide == entry.key ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentSlide == entry.key
                    ? AppTheme.goldColor
                    : Colors.grey.withOpacity(0.3),
              ),
            );
          }).toList(),
        ),
      ],
    ).animate().fadeIn().slideY(begin: 0.2);
  }

  Widget _buildQuickCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ÙØ²ÙØ¯ ÙÙ ÙØ§ ØªØ±ÙØ¯',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/categories');
                },
                child: const Text(
                  'Ø§ÙÙØ²ÙØ¯',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    color: AppTheme.goldColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _quickCategories.length,
            itemBuilder: (context, index) {
              final category = _quickCategories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/all_ads');
                },
                child: Container(
                  width: 80,
                  margin: const EdgeInsets.only(left: 12),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: category['color'].withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          category['icon'],
                          color: category['color'],
                          size: 28,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['name'],
                        style: TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 12,
                          color: AppTheme.getTextColor(context),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ).animate().fadeIn(delay: const Duration(milliseconds: 200));
  }

  Widget _buildAuctionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ÙØ²Ø§Ø¯ Ø§ÙØ¬ÙØ§Ø¨Ù Ø§ÙØ£Ø³Ø¨ÙØ¹Ù',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/auctions');
                },
                child: const Text(
                  'Ø§ÙÙØ²ÙØ¯',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    color: AppTheme.goldColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: _auctionProducts.length,
          itemBuilder: (context, index) {
            return AdCard(
              product: _auctionProducts[index],
              onTap: () {
                Navigator.pushNamed(context, '/ad_detail');
              },
            );
          },
        ),
      ],
    ).animate().fadeIn(delay: const Duration(milliseconds: 300));
  }

  Widget _buildRealEstateSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ø§ÙØ¹ÙØ§Ø±Ø§Øª ÙØ§ÙØ§Ø³ØªØ«ÙØ§Ø±Ø§Øª',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/categories');
                },
                child: const Text(
                  'Ø§ÙÙØ²ÙØ¯',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    color: AppTheme.goldColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _realEstateCategories.length,
            itemBuilder: (context, index) {
              final category = _realEstateCategories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/all_ads');
                },
                child: Container(
                  width: 90,
                  margin: const EdgeInsets.only(left: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: category['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category['icon'],
                        color: category['color'],
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['name'],
                        style: TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 11,
                          color: AppTheme.getTextColor(context),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ).animate().fadeIn(delay: const Duration(milliseconds: 400));
  }

  Widget _buildTechSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ø¹Ø§ÙÙ Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ§Øª ÙØ§ÙØªÙÙÙØ©',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/categories');
                },
                child: const Text(
                  'Ø§ÙÙØ²ÙØ¯',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    color: AppTheme.goldColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _techCategories.length,
            itemBuilder: (context, index) {
              final category = _techCategories[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/all_ads');
                },
                child: Container(
                  width: 90,
                  margin: const EdgeInsets.only(left: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: category['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category['icon'],
                        color: category['color'],
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category['name'],
                        style: TextStyle(
                          fontFamily: 'Changa',
                          fontSize: 11,
                          color: AppTheme.getTextColor(context),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ).animate().fadeIn(delay: const Duration(milliseconds: 500));
  }

  Widget _buildFeaturedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ÙÙØªØ¬Ø§Øª ÙÙÙØ²Ø©',
                style: TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.getTextColor(context),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/all_ads');
                },
                child: const Text(
                  'Ø§ÙÙØ²ÙØ¯',
                  style: TextStyle(
                    fontFamily: 'Changa',
                    color: AppTheme.goldColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: _newProducts.length,
          itemBuilder: (context, index) {
            return AdCard(
              product: _newProducts[index],
              onTap: () {
                Navigator.pushNamed(context, '/ad_detail');
              },
            );
          },
        ),
      ],
    ).animate().fadeIn(delay: const Duration(milliseconds: 600));
  }
}