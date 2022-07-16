import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/controllers/products_controller.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Brands"),
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
        () => productsController.brandListLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: productsController.brandList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(
                    () => CheckboxListTile(
                        title: Text(
                            productsController.brandList[index].name ?? ""),
                        value: productsController
                                .brandList[index].isSelected?.value ??
                            false,
                        onChanged: (value) {
                          productsController
                              .brandList[index].isSelected!.value = value!;
                          if (value) {
                            productsController.selectedBrands.add(
                                productsController.brandList[index].id ?? "");
                            productsController.selectedBrandsName.add(
                                productsController.brandList[index].name ?? "");
                          } else {
                            productsController.selectedBrands.remove(
                                productsController.brandList[index].id ?? "");
                            productsController.selectedBrandsName.remove(
                                productsController.brandList[index].name ?? "");
                          }
                        }),
                  );
                },
              ),
      ),
    );
  }
}
