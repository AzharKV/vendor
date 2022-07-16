// To parse this JSON data, do
//
//     final productAddModel = productAddModelFromJson(jsonString);

import 'dart:convert';

ProductAddModel productAddModelFromJson(String str) =>
    ProductAddModel.fromJson(json.decode(str));

String productAddModelToJson(ProductAddModel data) =>
    json.encode(data.toJson());

class ProductAddModel {
  ProductAddModel({
    this.status,
    this.message,
    this.resultData,
  });

  String? status;
  String? message;
  ResultData? resultData;

  factory ProductAddModel.fromJson(Map<String, dynamic> json) =>
      ProductAddModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        resultData: json["resultData"] == null
            ? null
            : ResultData.fromJson(json["resultData"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "resultData": resultData == null ? null : resultData!.toJson(),
      };
}

class ResultData {
  ResultData({
    this.name,
    this.userId,
    this.deliverable,
    this.price,
    this.modelId,
    this.categoryId,
    this.subCategoryId,
    this.images,
    this.thumbnail,
    this.description,
    this.quantity,
    this.offerPrice,
    this.sold,
    this.status,
    this.offerId,
    this.keywords,
    this.isActive,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? name;
  String? userId;
  Deliverable? deliverable;
  int? price;
  List<String>? modelId;
  String? categoryId;
  String? subCategoryId;
  List<dynamic>? images;
  List<dynamic>? thumbnail;
  String? description;
  int? quantity;
  int? offerPrice;
  int? sold;
  int? status;
  dynamic offerId;
  String? keywords;
  bool? isActive;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
        name: json["name"] == null ? null : json["name"],
        userId: json["user_id"] == null ? null : json["user_id"],
        deliverable: json["deliverable"] == null
            ? null
            : Deliverable.fromJson(json["deliverable"]),
        price: json["price"] == null ? null : json["price"],
        modelId: json["model_id"] == null
            ? null
            : List<String>.from(json["model_id"].map((x) => x)),
        categoryId: json["category_id"] == null ? null : json["category_id"],
        subCategoryId:
            json["sub_category_id"] == null ? null : json["sub_category_id"],
        images: json["images"] == null
            ? null
            : List<dynamic>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"] == null
            ? null
            : List<dynamic>.from(json["thumbnail"].map((x) => x)),
        description: json["description"] == null ? null : json["description"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
        sold: json["sold"] == null ? null : json["sold"],
        status: json["status"] == null ? null : json["status"],
        offerId: json["offerId"],
        keywords: json["keywords"] == null ? null : json["keywords"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        id: json["_id"] == null ? null : json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "user_id": userId == null ? null : userId,
        "deliverable": deliverable == null ? null : deliverable!.toJson(),
        "price": price == null ? null : price,
        "model_id":
            modelId == null ? null : List<dynamic>.from(modelId!.map((x) => x)),
        "category_id": categoryId == null ? null : categoryId,
        "sub_category_id": subCategoryId == null ? null : subCategoryId,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail == null
            ? null
            : List<dynamic>.from(thumbnail!.map((x) => x)),
        "description": description == null ? null : description,
        "quantity": quantity == null ? null : quantity,
        "offerPrice": offerPrice == null ? null : offerPrice,
        "sold": sold == null ? null : sold,
        "status": status == null ? null : status,
        "offerId": offerId,
        "keywords": keywords == null ? null : keywords,
        "isActive": isActive == null ? null : isActive,
        "_id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Deliverable {
  Deliverable({
    this.coordinates,
  });

  List<dynamic>? coordinates;

  factory Deliverable.fromJson(Map<String, dynamic> json) => Deliverable(
        coordinates: json["coordinates"] == null
            ? null
            : List<dynamic>.from(json["coordinates"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "coordinates": coordinates == null
            ? null
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}
