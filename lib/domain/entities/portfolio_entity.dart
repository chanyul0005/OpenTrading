class PortfolioEntity {
  final String id;
  final String userId;
  final List<PortfolioItemEntity> items;
  final double totalValue;

  const PortfolioEntity({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalValue,
  });
}

class PortfolioItemEntity {
  final String assetId;
  final int quantity;
  final double avgBuyPrice;

  const PortfolioItemEntity({
    required this.assetId,
    required this.quantity,
    required this.avgBuyPrice,
  });
}
