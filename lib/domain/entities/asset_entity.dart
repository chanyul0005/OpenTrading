enum AssetCategory { stock, coin, gameItem, sneaker }

class AssetEntity {
  final String id;
  final String name;
  final AssetCategory category;
  final double currentPrice;
  final String symbol;

  const AssetEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.currentPrice,
    required this.symbol,
  });
}
