import 'package:get/get.dart';
import 'package:vendor/config/api_list.dart';
import 'package:vendor/data/models/products_list_model.dart';
import 'package:vendor/data/repository/products_repository.dart';

class ProductsController extends GetxController {
  Rx<ProductsListModel> productsList = ProductsListModel().obs;

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
