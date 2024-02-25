import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String? id;
  String? name;
  String? description;
  int? price;
  int? processingTime;
  String? imageUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  OrderModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.processingTime,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as int?,
        processingTime: json['processingTime'] as int?,
        imageUrl: json['imageUrl'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'description': description,
        'price': price,
        'processingTime': processingTime,
        'imageUrl': imageUrl,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}
