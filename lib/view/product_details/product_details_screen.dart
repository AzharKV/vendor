import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/controllers/products_controller.dart';
import 'package:vendor/view/product_details/widgets/brand_select_widget.dart';
import 'package:vendor/view/product_details/widgets/category_drop_down_widget.dart';
import 'package:vendor/view/product_details/widgets/custom_text_field.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();
    productsController.fetchCategoryList();
    productsController.fetchBrandList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter Product Details"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Form(
            key: productsController.formKey,
            child: ListView(
              children: [
                CustomTextField(
                    nameController: productsController.nameController,
                    title: "Product Name"),
                CustomTextField(
                  nameController: productsController.priceController,
                  title: "Original Price/MRP",
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                  nameController: productsController.offerPriceController,
                  title: "Offer Price",
                  textInputType: TextInputType.number,
                ),
                Row(
                  children: const [
                    BrandSelectWidget(isBrand: true),
                    SizedBox(width: 8.0),
                    BrandSelectWidget(isBrand: false),
                  ],
                ),
                Row(
                  children: const [
                    CategoryDropDownWidget(isCategory: true),
                    SizedBox(width: 8.0),
                    CategoryDropDownWidget(isCategory: false),
                  ],
                ),
                CustomTextField(
                  nameController: productsController.stockController,
                  title: "In Stock Count",
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                  nameController: productsController.descriptionController,
                  title: "Description",
                  maxLines: 5,
                  textInputType: TextInputType.multiline,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () => productsController.submitForm(),
                  child: const Text('Submit',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ]
                  .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 18.0), child: e))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
