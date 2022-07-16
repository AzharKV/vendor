import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/controllers/products_controller.dart';
import 'package:vendor/data/models/category_list_model.dart';
import 'package:vendor/data/models/sub_category_list_model.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();

    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton<CategoryModel>(
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            items: productsController.categoryList
                .map<DropdownMenuItem<CategoryModel>>((val) {
              return DropdownMenuItem<CategoryModel>(
                value: val,
                child: Text(val.name ?? ""),
              );
            }).toList(),
            hint: Text(productsController.selectedCategory.value.name ??
                "---Select---"),
            onChanged: (val) {
              productsController.selectedCategory.value = val!;
              productsController.selectedSubCategory.value = SubCategoryModel();
              productsController.fetchSubCategoryList(val.id!);
            }),
      ),
    );
  }
}
