import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/controllers/products_controller.dart';

class BrandModelScreen extends StatelessWidget {
  const BrandModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();
    productsController.fetchModelBrandList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Models"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.check)),
        ],
      ),
      body: Obx(
        () => productsController.modelBrandListLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: productsController.brandModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    () => CheckboxListTile(
                        title: Text(
                            productsController.brandModelList[index].name ??
                                ""),
                        value: productsController
                                .brandModelList[index].isSelected?.value ??
                            false,
                        onChanged: (value) {
                          productsController
                              .brandModelList[index].isSelected!.value = value!;
                          if (value) {
                            productsController.selectedModelBrands.add(
                                productsController.brandModelList[index].id ??
                                    "");
                            productsController.selectedModelBrandsName.add(
                                productsController.brandModelList[index].name ??
                                    "");
                          } else {
                            productsController.selectedModelBrandsName.remove(
                                productsController.brandModelList[index].name ??
                                    "");
                          }
                        }),
                  );
                },
              ),
      ),
    );
  }
}
