import 'package:flutter/material.dart';
import 'package:vendor/view/product_details/widgets/category_drop_down.dart';
import 'package:vendor/view/product_details/widgets/sub_category_drop_down.dart';

class CategoryDropDownWidget extends StatelessWidget {
  const CategoryDropDownWidget({Key? key, required this.isCategory})
      : super(key: key);

  final bool isCategory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isCategory ? "Category" : "Sub Category"),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(4.0)),
            child: isCategory
                ? const CategoryDropDown()
                : const SubCategoryDropDown(),
          ),
        ],
      ),
    );
  }
}
