// To parse this JSON data, do
//
//     final subCategoryListModel = subCategoryListModelFromJson(jsonString);

import 'dart:convert';

SubCategoryListModel subCategoryListModelFromJson(String str) =>
    SubCategoryListModel.fromJson(json.decode(str));

String subCategoryListModelToJson(SubCategoryListModel data) =>
    json.encode(data.toJson());

class SubCategoryListModel {
  SubCategoryListModel({
    this.status,
    this.message,
    this.resultData,
  });

  String? status;
  String? message;
  List<SubCategoryModel>? resultData;

  factory SubCategoryListModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryListModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        resultData: json["resultData"] == null
            ? null
            : List<SubCategoryModel>.from(
                json["resultData"].map((x) => SubCategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "resultData": resultData == null
            ? null
            : List<dynamic>.from(resultData!.map((x) => x.toJson())),
      };
}

class SubCategoryModel {
  SubCategoryModel({
    this.id,
    this.name,
    this.categoryId,
    this.images,
    this.thumbnail,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.thumbUrl,
    this.imageUrl,
  });

  String? id;
  String? name;
  String? categoryId;
  List<String>? images;
  List<String>? thumbnail;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? thumbUrl;
  List<String>? imageUrl;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
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
        "category_id": categoryId == null ? null : categoryId,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail == null
            ? null
            : List<dynamic>.from(thumbnail!.map((x) => x)),
        "isActive": isActive == null ? null : isActive,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "thumbURL": thumbUrl == null
            ? null
            : List<dynamic>.from(thumbUrl!.map((x) => x)),
        "imageURL": imageUrl == null
            ? null
            : List<dynamic>.from(imageUrl!.map((x) => x)),
      };
}
