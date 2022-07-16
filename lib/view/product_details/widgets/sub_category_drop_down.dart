import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/controllers/products_controller.dart';
import 'package:vendor/data/models/sub_category_list_model.dart';

class SubCategoryDropDown extends StatelessWidget {
  const SubCategoryDropDown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();

    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton<SubCategoryModel>(
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            items: productsController.subCategoryList
                .map<DropdownMenuItem<SubCategoryModel>>((val) {
              return DropdownMenuItem<SubCategoryModel>(
                value: val,
                child: Text(val.name ?? ""),
              );
            }).toList(),
            hint: Text(
                productsController.selectedSubCategory.value.name ??
                    "---Select---",
                overflow: TextOverflow.ellipsis,
                maxLines: 1),
            onChanged: (val) {
              productsController.selectedSubCategory.value = val!;
            }),
      ),
    );
  }
}
