import 'package:flutter/material.dart';
import 'package:vendor/view/dashboard/widgets/option_container.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const Text("Products", style: TextStyle(fontSize: 24.0)),
                const SizedBox(height: 16.0),
                Expanded(
                  child: ListView.separated(
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: const Text("title"),
                        subtitle: const Text("price"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit)),
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
                )
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add, color: Colors.yellow),
                backgroundColor: Colors.black),
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
