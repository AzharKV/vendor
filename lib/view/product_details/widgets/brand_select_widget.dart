import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor/view/brand_model/brand_model_screen.dart';
import 'package:vendor/view/brand_model/brand_screen.dart';

class BrandSelectWidget extends StatelessWidget {
  const BrandSelectWidget({Key? key, required this.isBrand}) : super(key: key);

  final bool isBrand;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isBrand ? "Brand" : "Model"),
          const SizedBox(height: 8.0),
          GestureDetector(
            onTap: () => Get.to(
                () => isBrand ? const BrandScreen() : const BrandModelScreen()),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 4.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Select ${isBrand ? "Brand" : "Model"}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
