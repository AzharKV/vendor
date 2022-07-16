// To parse this JSON data, do
//
//     final modelListModel = modelListModelFromJson(jsonString?);

import 'dart:convert';

import 'package:get/get.dart';

BrandModelListModel modelListModelFromJson(String str) =>
    BrandModelListModel.fromJson(json.decode(str));

String? modelListModelToJson(BrandModelListModel data) =>
    json.encode(data.toJson());

class BrandModelListModel {
  BrandModelListModel({
    this.status,
    this.message,
    this.resultData,
  });

  String? status;
  String? message;
  List<BrandDataModel>? resultData;

  factory BrandModelListModel.fromJson(Map<String?, dynamic> json) =>
      BrandModelListModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        resultData: json["resultData"] == null
            ? null
            : List<BrandDataModel>.from(
                json["resultData"].map((x) => BrandDataModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "resultData": resultData == null
            ? null
            : List<dynamic>.from(resultData!.map((x) => x.toJson())),
      };
}

class BrandDataModel {
  BrandDataModel({
    this.id,
    this.name,
    this.makeId,
    this.carType,
    this.images,
    this.thumbnail,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isSelected,
  });

  String? id;
  String? name;
  String? makeId;
  String? carType;
  List<String>? images;
  List<String>? thumbnail;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  RxBool? isSelected;

  factory BrandDataModel.fromJson(Map<String, dynamic> json) => BrandDataModel(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        makeId: json["make_id"] == null ? null : json["make_id"],
        carType: json["carType"] == null ? null : json["carType"],
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
        isSelected: false.obs,
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "make_id": makeId == null ? null : makeId,
        "carType": carType == null ? null : carType,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "thumbnail": thumbnail == null
            ? null
            : List<dynamic>.from(thumbnail!.map((x) => x)),
        "isActive": isActive == null ? null : isActive,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
