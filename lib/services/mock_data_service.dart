import '../models/product.dart';
import '../models/skin_profile.dart';

class MockDataService {
  static const skinProfile = SkinProfile(
    glowIndex: 82,
    moisture: 61,
    evenness: 78,
    redTones: 34,
    shadeCode: '3W',
    skinTypeLabel: 'Kombinerad hud',
    undertoneLabel: 'varm underton',
    summary:
        'Torr i T-zonen, jämn ton och en lätt rodnad kring näsan — huden är i fin form, den vill bara ha mer fukt.',
    scannedDaysAgo: 2,
  );

  static const recommendations = [
    Product(
      id: 'concealer',
      name: 'Dewy Drops Serum Concealer',
      subtitle: 'Jämna ut tonen',
      priceKr: 295,
      matchPercent: 94,
      imageAsset: 'assets/images/product_concealer.jpg',
      description:
          'Serum-berikad concealer med samma formula som vår bästsäljande foundation — perfekt för att jämna ut tonen runt näsan.',
    ),
    Product(
      id: 'wake-me-up',
      name: 'Wake Me Up Cream',
      subtitle: 'För lyster och fukt',
      priceKr: 295,
      matchPercent: 91,
      imageAsset: 'assets/images/product_wake_me_up.jpg',
      description:
          'Color corrector som ger en utvilad, strålande look — idealisk när huden behöver mer fukt i T-zonen.',
    ),
    Product(
      id: 'foundation',
      name: 'Dewy Drops Serum Foundation',
      subtitle: 'Din matchning 3W',
      priceKr: 375,
      matchPercent: 89,
      imageAsset: 'assets/images/product_foundation.jpg',
      description:
          'Prisbelönt serum-foundation i 18 nyanser. Din nyans 3W ger en dewy finish som håller hela dagen.',
    ),
  ];

  static const forDigProducts = [
    Product(
      id: 'glow-blush',
      name: 'Glow Blush',
      subtitle: 'Milky Rose',
      priceKr: 295,
      matchPercent: 88,
      imageAsset: 'assets/images/product_glow_blush.jpg',
      description: 'Krämig blush med dewy finish — byggbar färg för sommarens glow.',
    ),
    Product(
      id: 'cushion-glaze',
      name: 'Cushion Glaze Lip Treatment',
      subtitle: 'Lip treat',
      priceKr: 245,
      matchPercent: 85,
      imageAsset: 'assets/images/product_cushion_glaze.jpg',
      description: 'Cushiony, glazy lip treat som ger fukt och glans.',
    ),
    Product(
      id: 'sun-glaze',
      name: 'Sun Glaze Drops',
      subtitle: 'Bronzing gel',
      priceKr: 295,
      matchPercent: 82,
      imageAsset: 'assets/images/product_sun_glaze.jpg',
      description: 'Soldränkt bronzing gel för sommarens glow.',
    ),
  ];
}
