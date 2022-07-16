import 'dart:convert';

import 'package:vendor/data/models/brand_list_model.dart';
import 'package:vendor/data/models/brand_model_list_model.dart';
import 'package:vendor/data/models/category_list_model.dart';
import 'package:vendor/data/models/product_add_model.dart';
import 'package:vendor/data/models/products_list_model.dart';
import 'package:vendor/data/models/sub_category_list_model.dart';
import 'package:vendor/services/http_services.dart';

class ProductsRepository {
  HttpService httpService = HttpService();

  Future<dynamic> fetchProductsList(String url) async {
    var response = await httpService.get(url);

    return ProductsListModel.fromJson(response);
  }

  Future<dynamic> fetchBrandList(String url) async {
    var response = await httpService.get(url);

    return BrandListModel.fromJson(response);
  }

  Future<dynamic> fetchBrandModelList(String url, body) async {
    var response = await httpService.post(url, jsonEncode(body));

    return BrandModelListModel.fromJson(response);
  }

  Future<dynamic> fetchCategoryList(String url) async {
    var response = await httpService.get(url);

    return CategoryListModel.fromJson(response);
  }

  Future<dynamic> fetchSubCategoryList(String url) async {
    var response = await httpService.get(url);

    return SubCategoryListModel.fromJson(response);
  }

  Future<dynamic> addProduct(String url, body) async {
    var response = await httpService.post(url, jsonEncode(body));

    return ProductAddModel.fromJson(response);
  }

  Future<dynamic> productImageUpload(String url, imagePath, id) async {
    var response =
        await httpService.multipart(imagePath: imagePath, url: url, id: id);

    return jsonDecode(response.body);
  }
}
