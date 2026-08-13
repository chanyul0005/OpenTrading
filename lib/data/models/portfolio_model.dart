import '../../domain/entities/portfolio_entity.dart';

class PortfolioModel extends PortfolioEntity {
  PortfolioModel({
    required super.id,
    required super.userId,
    required super.items,
    required super.totalValue,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'items': items
            .map((e) => {
                  'assetId': e.assetId,
                  'quantity': e.quantity,
                  'avgBuyPrice': e.avgBuyPrice,
                })
            .toList(),
        'totalValue': totalValue,
      };

  factory PortfolioModel.fromJson(Map<String, dynamic> json) => PortfolioModel(
        id: json['id'] as String,
        userId: json['userId'] as String,
        items: (json['items'] as List<dynamic>)
            .map((e) => PortfolioItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalValue: (json['totalValue'] as num).toDouble(),
      );
}

class PortfolioItemModel extends PortfolioItemEntity {
  PortfolioItemModel({
    required super.assetId,
    required super.quantity,
    required super.avgBuyPrice,
  });

  Map<String, dynamic> toJson() => {
        'assetId': assetId,
        'quantity': quantity,
        'avgBuyPrice': avgBuyPrice,
      };

  factory PortfolioItemModel.fromJson(Map<String, dynamic> json) =>
      PortfolioItemModel(
        assetId: json['assetId'] as String,
        quantity: json['quantity'] as int,
        avgBuyPrice: (json['avgBuyPrice'] as num).toDouble(),
      );
}
