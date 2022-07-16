import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    Key? key,
    this.initialValue,
  }) : super(key: key);

  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          items: [].map<DropdownMenuItem<String>>((val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val),
            );
          }).toList(),
          hint: Text(initialValue ?? "---Select---"),
          onChanged: (val) {}),
    );
  }
}
