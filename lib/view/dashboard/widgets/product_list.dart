import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/controllers/products_controller.dart';
import 'package:vendor/data/models/products_list_model.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.put(ProductsController());

    return Expanded(
      child: Obx(
        () => ListView.separated(
          itemCount:
              productsController.productsList.value.resultData?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            Product data =
                productsController.productsList.value.resultData![index];

            return ListTile(
              title: Text(data.name ?? ""),
              subtitle: Text(
                "₹ ${data.price ?? 0}",
                style: const TextStyle(color: Colors.green),
              ),
              leading: Image.network(
                data.thumbUrl![0],
                width: 50.0,
                fit: BoxFit.fill,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
