import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/config/api_list.dart';
import 'package:vendor/data/models/brand_list_model.dart';
import 'package:vendor/data/models/brand_model_list_model.dart';
import 'package:vendor/data/models/category_list_model.dart';
import 'package:vendor/data/models/product_add_model.dart';
import 'package:vendor/data/models/products_list_model.dart';
import 'package:vendor/data/models/sub_category_list_model.dart';
import 'package:vendor/data/repository/products_repository.dart';
import 'package:vendor/view/dashboard/dashboard_screen.dart';
import 'package:vendor/view/product_details/widgets/image_upload_widget.dart';

class ProductsController extends GetxController {
  ProductsRepository productsRepository = ProductsRepository();

  Rx<ProductsListModel> productsList = ProductsListModel().obs;
  RxList<BrandModel> brandList = <BrandModel>[].obs;
  RxList<BrandDataModel> brandModelList = <BrandDataModel>[].obs;
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<SubCategoryModel> subCategoryList = <SubCategoryModel>[].obs;

  Rx<CategoryModel> selectedCategory = CategoryModel().obs;
  Rx<SubCategoryModel> selectedSubCategory = SubCategoryModel().obs;

  RxBool brandListLoading = true.obs;
  RxBool modelBrandListLoading = true.obs;

  List<String> selectedBrands = [];
  List<String> selectedModelBrands = [];
  List<String> selectedBrandsName = [];
  List<String> selectedModelBrandsName = [];

  String addedProductId = "";

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
    var result =
        await productsRepository.fetchProductsList(ApiList.productList);

    ProductsListModel data = result;

    productsList.value = data;
  }

  Future<void> fetchBrandList() async {
    brandListLoading.value = true;

    var result = await productsRepository.fetchBrandList(ApiList.brandsList);

    brandList.value = result.resultData ?? [];

    brandListLoading.value = false;
  }

  Future<void> fetchModelBrandList() async {
    modelBrandListLoading.value = true;

    var body = {"makes": selectedBrands};

    var result = await productsRepository.fetchBrandModelList(
        ApiList.brandsModelList, body);

    brandModelList.value = result.resultData ?? [];

    modelBrandListLoading.value = false;
  }

  Future<void> fetchCategoryList() async {
    var result =
        await productsRepository.fetchCategoryList(ApiList.categoryList);

    categoryList.value = result.resultData ?? [];
  }

  Future<void> fetchSubCategoryList(String categoryId) async {
    var result = await productsRepository
        .fetchSubCategoryList(ApiList.subCategoryList + categoryId);

    subCategoryList.value = result.resultData ?? [];
  }

  Future<void> submitForm() async {
    var body = {
      "name": nameController.text,
      "sub_category_id": selectedSubCategory.value.id,
      "user_id": "629af5a2d77f59471ab24007",
      "category_id": selectedCategory.value.id,
      "model_id": selectedBrands,
      "quantity": stockController.text,
      "price": priceController.text,
      "offerPrice": offerPriceController.text,
      "description": descriptionController.text,
      "keywords": nameController.text
    };

    var result = await productsRepository.addProduct(ApiList.addProduct, body);

    ProductAddModel productModel = result;
    addedProductId = productModel.resultData?.id ?? "";

    Get.dialog(const ImageUploadWidget());
  }

  Future<void> submitImage(String imagePath) async {
    var result = await productsRepository.productImageUpload(
        ApiList.imageUpload, imagePath, addedProductId);

    if (result["errorCode"] == 144) {
      Get.snackbar(result["status"], result["message"],
          backgroundColor: Colors.white);
    } else {
      Get.snackbar('', result["message"]);
      Get.offAll(() => const DashBoardScreen());
    }
  }
}
