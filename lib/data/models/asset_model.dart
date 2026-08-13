import '../../domain/entities/asset_entity.dart';

class AssetModel extends AssetEntity {
  AssetModel({
    required super.id,
    required super.name,
    required super.category,
    required super.currentPrice,
    required super.symbol,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category.index,
        'currentPrice': currentPrice,
        'symbol': symbol,
      };

  factory AssetModel.fromJson(Map<String, dynamic> json) => AssetModel(
        id: json['id'] as String,
        name: json['name'] as String,
        category: AssetCategory.values[json['category'] as int],
        currentPrice: (json['currentPrice'] as num).toDouble(),
        symbol: json['symbol'] as String,
      );
}
