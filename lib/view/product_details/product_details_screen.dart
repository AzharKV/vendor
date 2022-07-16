import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/controllers/products_controller.dart';
import 'package:vendor/controllers/widgets/brand_drop_down_widget.dart';
import 'package:vendor/controllers/widgets/category_drop_down_widget.dart';
import 'package:vendor/controllers/widgets/custom_text_field.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();
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
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: productsController.formKey,
            child: ListView(
              children: [
                CustomTextField(
                    nameController: productsController.nameController,
                    title: "Product Name"),
                CustomTextField(
                    nameController: productsController.priceController,
                    title: "Original Price/MRP"),
                CustomTextField(
                    nameController: productsController.offerPriceController,
                    title: "Offer Price"),
                Row(
                  children: const [
                    BrandDropDownWidget(title: "Brand"),
                    SizedBox(width: 8.0),
                    BrandDropDownWidget(title: "Model"),
                  ],
                ),
                Row(
                  children: const [
                    CategoryDropDownWidget(title: "Category"),
                    SizedBox(width: 8.0),
                    CategoryDropDownWidget(title: "Sub Category"),
                  ],
                ),
                CustomTextField(
                    nameController: productsController.stockController,
                    title: "In Stock Count"),
                CustomTextField(
                  nameController: productsController.descriptionController,
                  title: "Description",
                  maxLines: 10,
                  textInputType: TextInputType.multiline,
                ),
                TextButton(onPressed: () {}, child: const Text("Submit"))
              ]
                  .map((e) => Padding(
                      padding: const EdgeInsets.only(bottom: 20.0), child: e))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
