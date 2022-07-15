import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/controllers/products_controller.dart';
import 'package:vendor/data/models/products_list_model.dart';
import 'package:vendor/view/dashboard/widgets/option_container.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.put(ProductsController());

    return Scaffold(
      appBar: AppBar(title: const Text("DashBoard"), centerTitle: true),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Hello Vendor", style: TextStyle(fontSize: 24.0)),
                const SizedBox(height: 16.0),
                Row(
                  children: const [
                    OptionContainer(title: "Analysis", iconData: Icons.search),
                    SizedBox(width: 12.0),
                    OptionContainer(
                        title: "Ratings & Reviews", iconData: Icons.star),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text("Products", style: TextStyle(fontSize: 20.0)),
                const SizedBox(height: 16.0),
                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      itemCount: productsController
                              .productsList.value.resultData?.length ??
                          0,
                      itemBuilder: (BuildContext context, int index) {
                        Product data = productsController
                            .productsList.value.resultData![index];

                        return ListTile(
                          title: Text(data.name ?? ""),
                          subtitle: Text(
                            "₹ ${data.price ?? 0}",
                            style: const TextStyle(color: Colors.green),
                          ),
                          leading: Image.network(
                            data.imageUrl![0],
                            width: 50.0,
                            fit: BoxFit.fill,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete)),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.black,
                child: const Icon(Icons.add, color: Colors.yellow)),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home, color: Colors.grey)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.card_travel, color: Colors.grey)),
              const SizedBox(width: 20.0),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.monetization_on, color: Colors.grey)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.vertical_split_sharp,
                      color: Colors.grey)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.shopping_bag_outlined, color: Colors.yellow),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
