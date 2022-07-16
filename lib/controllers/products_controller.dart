import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/config/api_list.dart';
import 'package:vendor/data/models/products_list_model.dart';
import 'package:vendor/data/repository/products_repository.dart';

class ProductsController extends GetxController {
  Rx<ProductsListModel> productsList = ProductsListModel().obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController offerPriceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    fetchProductsList();
    super.onInit();
  }

  Future<void> fetchProductsList() async {
    ProductsRepository productsRepository = ProductsRepository();
    var result =
        await productsRepository.fetchProductsList(ApiList.productList);

    ProductsListModel data = result;

    productsList.value = data;
  }
}
