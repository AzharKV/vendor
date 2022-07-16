import 'package:flutter/material.dart';
import 'package:vendor/controllers/widgets/custom_drop_down.dart';

class BrandDropDownWidget extends StatelessWidget {
  const BrandDropDownWidget({
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
          Card(
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomDropDown(initialValue: "Select $title"),
            ),
          ),
        ],
      ),
    );
  }
}
