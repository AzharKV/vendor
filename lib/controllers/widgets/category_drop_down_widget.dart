import 'package:flutter/material.dart';
import 'package:vendor/controllers/widgets/custom_drop_down.dart';

class CategoryDropDownWidget extends StatelessWidget {
  const CategoryDropDownWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(height: 8.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(4.0)),
            child: const CustomDropDown(),
          ),
        ],
      ),
    );
  }
}
