import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.nameController,
    required this.title,
    this.maxLines,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  final TextEditingController nameController;
  final String title;
  final int? maxLines;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      keyboardType: textInputType,
      maxLines: maxLines,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        focusColor: Colors.black,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        hintText: title,
        labelText: title,
        labelStyle: const TextStyle(color: Colors.black),
        alignLabelWithHint: true,
      ),
    );
  }
}
