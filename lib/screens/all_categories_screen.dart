import 'products_screen.dart';
import 'package:flex_yemen/models/rating_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import 'categories/health_beauty_screen.dart';
import 'categories/home_appliances_screen.dart';
import 'categories/kitchen_food_screen.dart';
import 'categories/handicrafts_antiques_screen.dart';
import 'categories/construction_materials_screen.dart';
import 'categories/agriculture_screen.dart';
import 'categories/education_screen.dart';
import 'categories/travel_tourism_screen.dart';
import 'categories/auctions_category_screen.dart';
import 'categories/donations_screen.dart';
import 'categories/luxury_items_screen.dart';
import 'categories/heavy_equipment_screen.dart';
import 'categories/software_screen.dart';
import 'categories/security_safety_screen.dart';
import 'categories/aviation_screen.dart';
import 'categories/music_screen.dart';
import 'categories/currency_screen.dart';
import 'categories/cinema_screen.dart';
import 'categories/luxury_cars_screen.dart';
import 'categories/commercial_realestate_screen.dart';
import 'categories/consumer_electronics_screen.dart';
import 'categories/luxury_furniture_screen.dart';
import 'categories/jewelry_watches_screen.dart';
import 'categories/perfumes_makeup_screen.dart';
import 'categories/food_beverages_screen.dart';
import 'categories/baby_kids_screen.dart';
import 'categories/pets_screen.dart';
import 'categories/gifts_screen.dart';
import 'categories/sports_fitness_screen.dart';
import 'categories/stationery_screen.dart';
import 'categories/industrial_equipment_screen.dart';
import 'categories/electrical_tools_screen.dart';
import 'categories/plumbing_tools_screen.dart';
import 'categories/carpentry_tools_screen.dart';
import 'categories/blacksmith_tools_screen.dart';
import 'categories/home_services_screen.dart';
import 'categories/car_services_screen.dart';
import 'categories/contracting_services_screen.dart';
import 'categories/delivery_services_screen.dart';
import 'categories/training_services_screen.dart';
import 'categories/medical_equipment_screen.dart';
import 'categories/cosmetics_screen.dart';
import 'categories/hair_care_screen.dart';
import 'categories/skin_care_screen.dart';
import 'categories/perfumes_screen.dart';
import 'categories/groceries_screen.dart';
import 'categories/beverages_screen.dart';
import 'categories/fruits_vegetables_screen.dart';
import 'categories/meat_poultry_screen.dart';
import 'categories/seafood_screen.dart';
import 'categories/dairy_products_screen.dart';
import 'categories/bakery_screen.dart';
import 'categories/desserts_screen.dart';
import 'categories/nuts_dried_fruits_screen.dart';
import 'categories/canned_food_screen.dart';
import 'categories/spices_screen.dart';
import 'categories/rice_grains_screen.dart';
import 'categories/oils_fats_screen.dart';
import 'categories/sugar_sweets_screen.dart';
import 'categories/hot_drinks_screen.dart';
import 'categories/cold_drinks_screen.dart';
import 'categories/wedding_supplies_screen.dart';
import 'categories/graduation_parties_screen.dart';
import 'categories/birthday_supplies_screen.dart';
import 'categories/events_supplies_screen.dart';
import 'categories/traditional_food_screen.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Ø¬ÙÙØ¹ Ø§ÙØ£ÙØ³Ø§Ù'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          CategorySection(title: 'Ø§ÙØµØ­Ø© ÙØ§ÙØ¬ÙØ§Ù', screen: HealthBeautyScreen(), color: Colors.pink),
          CategorySection(title: 'Ø§ÙØ£Ø¬ÙØ²Ø© Ø§ÙÙÙØ²ÙÙØ©', screen: HomeAppliancesScreen(), color: Colors.cyan),
          CategorySection(title: 'Ø§ÙÙØ·Ø¨Ø® ÙØ§ÙØ·Ø¹Ø§Ù', screen: KitchenFoodScreen(), color: Colors.amber),
          CategorySection(title: 'Ø§ÙØ­Ø±Ù ÙØ§ÙØªØ­Ù', screen: HandicraftsAntiquesScreen(), color: Colors.brown),
          CategorySection(title: 'ÙÙØ§Ø¯ Ø§ÙØ¨ÙØ§Ø¡', screen: ConstructionMaterialsScreen(), color: Colors.grey),
          CategorySection(title: 'Ø§ÙØ²Ø±Ø§Ø¹Ø©', screen: AgricultureScreen(), color: Colors.green),
          CategorySection(title: 'Ø§ÙØªØ¹ÙÙÙ', screen: EducationScreen(), color: Colors.blue),
          CategorySection(title: 'Ø§ÙØ³ÙØ± ÙØ§ÙØ³ÙØ§Ø­Ø©', screen: TravelTourismScreen(), color: Colors.orange),
          CategorySection(title: 'Ø§ÙÙØ²Ø§Ø¯Ø§Øª', screen: AuctionsCategoryScreen(), color: Colors.red),
          CategorySection(title: 'Ø§ÙØªØ¨Ø±Ø¹Ø§Øª', screen: DonationsScreen(), color: Colors.teal),
          CategorySection(title: 'Ø§ÙÙÙØ§ÙÙØ§Øª', screen: LuxuryItemsScreen(), color: Colors.purple),
          CategorySection(title: 'Ø§ÙÙØ¹Ø¯Ø§Øª Ø§ÙØ«ÙÙÙØ©', screen: HeavyEquipmentScreen(), color: Colors.yellow),
          CategorySection(title: 'Ø§ÙØ¨Ø±ÙØ¬ÙØ§Øª', screen: SoftwareScreen(), color: Colors.indigo),
          CategorySection(title: 'Ø§ÙØ£ÙÙ ÙØ§ÙØ³ÙØ§ÙØ©', screen: SecuritySafetyScreen(), color: Colors.grey),
          CategorySection(title: 'Ø§ÙØ·ÙØ±Ø§Ù', screen: AviationScreen(), color: Colors.lightBlue),
          CategorySection(title: 'Ø§ÙÙÙØ³ÙÙÙ', screen: MusicScreen(), color: Colors.purple),
          CategorySection(title: 'Ø§ÙØ¹ÙÙØ§Øª ÙØ§ÙØ·ÙØ§Ø¨Ø¹', screen: CurrencyScreen(), color: Colors.amber),
          CategorySection(title: 'Ø§ÙØ³ÙÙÙØ§', screen: CinemaScreen(), color: Colors.red),
          CategorySection(title: 'Ø§ÙØ³ÙØ§Ø±Ø§Øª Ø§ÙÙØ§Ø®Ø±Ø©', screen: LuxuryCarsScreen(), color: Colors.grey),
          CategorySection(title: 'Ø§ÙØ¹ÙØ§Ø±Ø§Øª Ø§ÙØªØ¬Ø§Ø±ÙØ©', screen: CommercialRealestateScreen(), color: Colors.blue),
          CategorySection(title: 'Ø§ÙØ¥ÙÙØªØ±ÙÙÙØ§Øª Ø§ÙØ§Ø³ØªÙÙØ§ÙÙØ©', screen: ConsumerElectronicsScreen(), color: Colors.red),
          CategorySection(title: 'Ø§ÙØ£Ø«Ø§Ø« Ø§ÙÙØ§Ø®Ø±', screen: LuxuryFurnitureScreen(), color: Colors.brown),
          CategorySection(title: 'Ø§ÙÙØ¬ÙÙØ±Ø§Øª ÙØ§ÙØ³Ø§Ø¹Ø§Øª', screen: JewelryWatchesScreen(), color: Colors.amber),
          CategorySection(title: 'Ø§ÙØ¹Ø·ÙØ± ÙØ§ÙÙÙÙØ§Ø¬', screen: PerfumesMakeupScreen(), color: Colors.pink),
          CategorySection(title: 'Ø§ÙØ£Ø·Ø¹ÙØ© ÙØ§ÙÙØ´Ø±ÙØ¨Ø§Øª', screen: FoodBeveragesScreen(), color: Colors.orange),
          CategorySection(title: 'ÙØ³ØªÙØ²ÙØ§Øª Ø§ÙØ£Ø·ÙØ§Ù', screen: BabyKidsScreen(), color: Colors.blue),
          CategorySection(title: 'Ø§ÙØ­ÙÙØ§ÙØ§Øª Ø§ÙØ£ÙÙÙØ©', screen: PetsScreen(), color: Colors.brown),
          CategorySection(title: 'Ø§ÙÙØ¯Ø§ÙØ§', screen: GiftsScreen(), color: Colors.red),
          CategorySection(title: 'Ø§ÙØ±ÙØ§Ø¶Ø© ÙØ§ÙÙÙØ§ÙØ©', screen: SportsFitnessScreen(), color: Colors.green),
          CategorySection(title: 'Ø§ÙÙØ±Ø·Ø§Ø³ÙØ©', screen: StationeryScreen(), color: Colors.purple),
          CategorySection(title: 'Ø§ÙÙØ¹Ø¯Ø§Øª Ø§ÙØµÙØ§Ø¹ÙØ©', screen: IndustrialEquipmentScreen(), color: Colors.grey),
          CategorySection(title: 'Ø§ÙØ£Ø¯ÙØ§Øª Ø§ÙÙÙØ±Ø¨Ø§Ø¦ÙØ©', screen: ElectricalToolsScreen(), color: Colors.yellow),
          CategorySection(title: 'Ø£Ø¯ÙØ§Øª Ø§ÙØ³Ø¨Ø§ÙØ©', screen: PlumbingToolsScreen(), color: Colors.blue),
          CategorySection(title: 'Ø£Ø¯ÙØ§Øª Ø§ÙÙØ¬Ø§Ø±Ø©', screen: CarpentryToolsScreen(), color: Colors.orange),
          CategorySection(title: 'Ø£Ø¯ÙØ§Øª Ø§ÙØ­Ø¯Ø§Ø¯Ø©', screen: BlacksmithToolsScreen(), color: Colors.brown),
          CategorySection(title: 'Ø§ÙØ®Ø¯ÙØ§Øª Ø§ÙÙÙØ²ÙÙØ©', screen: HomeServicesScreen(), color: Colors.blue),
          CategorySection(title: 'Ø®Ø¯ÙØ§Øª Ø§ÙØ³ÙØ§Ø±Ø§Øª', screen: CarServicesScreen(), color: Colors.red),
          CategorySection(title: 'Ø®Ø¯ÙØ§Øª Ø§ÙÙÙØ§ÙÙØ§Øª', screen: ContractingServicesScreen(), color: Colors.green),
          CategorySection(title: 'Ø®Ø¯ÙØ§Øª Ø§ÙÙÙÙ ÙØ§ÙØªÙØµÙÙ', screen: DeliveryServicesScreen(), color: Colors.orange),
          CategorySection(title: 'Ø®Ø¯ÙØ§Øª Ø§ÙØªØ¹ÙÙÙ ÙØ§ÙØªØ¯Ø±ÙØ¨', screen: TrainingServicesScreen(), color: Colors.purple),
          CategorySection(title: 'Ø§ÙÙØ¹Ø¯Ø§Øª Ø§ÙØ·Ø¨ÙØ©', screen: MedicalEquipmentScreen(), color: Colors.red),
          CategorySection(title: 'ÙØ³ØªØ­Ø¶Ø±Ø§Øª Ø§ÙØªØ¬ÙÙÙ', screen: CosmeticsScreen(), color: Colors.pink),
          CategorySection(title: 'Ø§ÙØ¹ÙØ§ÙØ© Ø¨Ø§ÙØ´Ø¹Ø±', screen: HairCareScreen(), color: Colors.blue),
          CategorySection(title: 'Ø§ÙØ¹ÙØ§ÙØ© Ø¨Ø§ÙØ¨Ø´Ø±Ø©', screen: SkinCareScreen(), color: Colors.green),
          CategorySection(title: 'Ø§ÙØ¹Ø·ÙØ±', screen: PerfumesScreen(), color: Colors.amber),
          CategorySection(title: 'Ø§ÙÙÙØ§Ø¯ Ø§ÙØºØ°Ø§Ø¦ÙØ©', screen: GroceriesScreen(), color: Colors.brown),
          CategorySection(title: 'Ø§ÙÙØ´Ø±ÙØ¨Ø§Øª', screen: BeveragesScreen(), color: Colors.blue),
          CategorySection(title: 'Ø§ÙØ®Ø¶Ø±ÙØ§Øª ÙØ§ÙÙÙØ§ÙÙ', screen: FruitsVegetablesScreen(), color: Colors.green),
          CategorySection(title: 'Ø§ÙÙØ­ÙÙ ÙØ§ÙØ¯ÙØ§Ø¬Ù', screen: MeatPoultryScreen(), color: Colors.red),
          CategorySection(title: 'Ø§ÙØ£Ø³ÙØ§Ù', screen: SeafoodScreen(), color: Colors.cyan),
          CategorySection(title: 'ÙÙØªØ¬Ø§Øª Ø§ÙØ£ÙØ¨Ø§Ù', screen: DairyProductsScreen(), color: Colors.white),
          CategorySection(title: 'Ø§ÙÙØ®Ø¨ÙØ²Ø§Øª', screen: BakeryScreen(), color: Colors.brown),
          CategorySection(title: 'Ø§ÙØ­ÙÙÙØ§Øª', screen: DessertsScreen(), color: Colors.pink),
          CategorySection(title: 'Ø§ÙÙÙØ³Ø±Ø§Øª', screen: NutsDriedFruitsScreen(), color: Colors.green),
          CategorySection(title: 'Ø§ÙØ£ØºØ°ÙØ© Ø§ÙÙØ¹ÙØ¨Ø©', screen: CannedFoodScreen(), color: Colors.blue),
          CategorySection(title: 'Ø§ÙØªÙØ§Ø¨Ù ÙØ§ÙØ¨ÙØ§Ø±Ø§Øª', screen: SpicesScreen(), color: Colors.orange),
          CategorySection(title: 'Ø§ÙØ£Ø±Ø² ÙØ§ÙØ­Ø¨ÙØ¨', screen: RiceGrainsScreen(), color: Colors.brown),
          CategorySection(title: 'Ø§ÙØ²ÙÙØª ÙØ§ÙØ¯ÙÙÙ', screen: OilsFatsScreen(), color: Colors.yellow),
          CategorySection(title: 'Ø§ÙØ³ÙØ± ÙØ§ÙØ­ÙÙÙØ§Øª', screen: SugarSweetsScreen(), color: Colors.pink),
          CategorySection(title: 'Ø§ÙÙØ´Ø±ÙØ¨Ø§Øª Ø§ÙØ³Ø§Ø®ÙØ©', screen: HotDrinksScreen(), color: Colors.brown),
          CategorySection(title: 'Ø§ÙÙØ´Ø±ÙØ¨Ø§Øª Ø§ÙØ¨Ø§Ø±Ø¯Ø©', screen: ColdDrinksScreen(), color: Colors.orange),
          CategorySection(title: 'ØªØ¬ÙÙØ²Ø§Øª Ø§ÙØ£Ø¹Ø±Ø§Ø³', screen: WeddingSuppliesScreen(), color: Colors.pink),
          CategorySection(title: 'Ø­ÙÙØ§Øª ÙØªØ®Ø±Ø¬', screen: GraduationPartiesScreen(), color: Colors.blue),
          CategorySection(title: 'Ø£Ø¹ÙØ§Ø¯ Ø§ÙÙÙÙØ§Ø¯', screen: BirthdaySuppliesScreen(), color: Colors.red),
          CategorySection(title: 'ØªØ¬ÙÙØ²Ø§Øª Ø§ÙØ­ÙÙØ§Øª', screen: EventsSuppliesScreen(), color: Colors.green),
          CategorySection(title: 'Ø§ÙÙØ£ÙÙÙØ§Øª Ø§ÙØ´Ø¹Ø¨ÙØ©', screen: TraditionalFoodScreen(), color: Colors.orange),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  final String title;
  final Widget screen;
  final Color color;

  const CategorySection({
    super.key,
    required this.title,
    required this.screen,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => screen),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkCard : AppTheme.lightCard,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.category, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Changa',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}