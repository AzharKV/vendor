// To parse this JSON data, do
//
//     final productsListModel = productsListModelFromJson(jsonString);

import 'dart:convert';

ProductsListModel productsListModelFromJson(String str) =>
    ProductsListModel.fromJson(json.decode(str));

String productsListModelToJson(ProductsListModel data) =>
    json.encode(data.toJson());

class ProductsListModel {
  ProductsListModel({
    this.status,
    this.message,
    this.resultData,
  });

  String? status;
  String? message;
  List<Product>? resultData;

  factory ProductsListModel.fromJson(Map<String, dynamic> json) =>
      ProductsListModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        resultData: json["resultData"] == null
            ? null
            : List<Product>.from(
                json["resultData"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "resultData": resultData == null
            ? null
            : List<dynamic>.from(resultData!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
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
    this.createdAt,
    this.updatedAt,
    this.v,
    this.thumbUrl,
    this.imageUrl,
  });

  String? id;
  String? name;
  String? userId;
  Deliverable? deliverable;
  int? price;
  List<Id>? modelId;
  Id? categoryId;
  Id? subCategoryId;
  List<String>? images;
  List<String>? thumbnail;
  String? description;
  int? quantity;
  int? offerPrice;
  int? sold;
  int? status;
  dynamic offerId;
  String? keywords;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  List<String>? thumbUrl;
  List<String>? imageUrl;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        userId: json["user_id"] == null ? null : json["user_id"],
        deliverable: json["deliverable"] == null
            ? null
            : Deliverable.fromJson(json["deliverable"]),
        price: json["price"] == null ? null : json["price"],
        modelId: json["model_id"] == null
            ? null
            : List<Id>.from(json["model_id"].map((x) => Id.fromJson(x))),
        categoryId: json["category_id"] == null
            ? null
            : Id.fromJson(json["category_id"]),
        subCategoryId: json["sub_category_id"] == null
            ? null
            : Id.fromJson(json["sub_category_id"]),
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"] == null
            ? null
            : List<String>.from(json["thumbnail"].map((x) => x)),
        description: json["description"] == null ? null : json["description"],
        quantity: json["quantity"] == null ? null : json["quantity"],
        offerPrice: json["offerPrice"] == null ? null : json["offerPrice"],
        sold: json["sold"] == null ? null : json["sold"],
        status: json["status"] == null ? null : json["status"],
        offerId: json["offerId"],
        keywords: json["keywords"] == null ? null : json["keywords"],
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        thumbUrl: json["thumbURL"] == null
            ? null
            : List<String>.from(json["thumbURL"].map((x) => x)),
        imageUrl: json["imageURL"] == null
            ? null
            : List<String>.from(json["imageURL"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "user_id": userId == null ? null : userId,
        "deliverable": deliverable == null ? null : deliverable!.toJson(),
        "price": price == null ? null : price,
        "model_id": modelId == null
            ? null
            : List<dynamic>.from(modelId!.map((x) => x.toJson())),
        "category_id": categoryId == null ? null : categoryId!.toJson(),
        "sub_category_id":
            subCategoryId == null ? null : subCategoryId!.toJson(),
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
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
        "thumbURL": thumbUrl == null
            ? null
            : List<dynamic>.from(thumbUrl!.map((x) => x)),
        "imageURL": imageUrl == null
            ? null
            : List<dynamic>.from(imageUrl!.map((x) => x)),
      };
}

class Id {
  Id({
    this.id,
    this.name,
    this.images,
    this.thumbnail,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.makeId,
    this.carType,
    this.categoryId,
  });

  String? id;
  String? name;
  List<String>? images;
  List<String>? thumbnail;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? makeId;
  String? carType;
  String? categoryId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"] == null
            ? null
            : List<String>.from(json["thumbnail"].map((x) => x)),
        isActive: json["isActive"] == null ? null : json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        makeId: json["make_id"] == null ? null : json["make_id"],
        carType: json["carType"] == null ? null : json["carType"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail == null
            ? null
            : List<dynamic>.from(thumbnail!.map((x) => x)),
        "isActive": isActive == null ? null : isActive,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
        "make_id": makeId == null ? null : makeId,
        "carType": carType == null ? null : carType,
        "category_id": categoryId == null ? null : categoryId,
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
