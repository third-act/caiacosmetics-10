class Product {
  const Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.priceKr,
    required this.matchPercent,
    required this.imageAsset,
    required this.description,
  });

  final String id;
  final String name;
  final String subtitle;
  final int priceKr;
  final int matchPercent;
  final String imageAsset;
  final String description;
}
