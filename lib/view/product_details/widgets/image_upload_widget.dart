import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor/controllers/products_controller.dart';

class ImageUploadWidget extends StatefulWidget {
  const ImageUploadWidget({Key? key}) : super(key: key);

  @override
  State<ImageUploadWidget> createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    ProductsController productsController = Get.find<ProductsController>();

    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Product created successfully"),
          InkWell(
            onTap: () async {
              XFile? imagePicker =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              if (imagePicker != null) {
                setState(() {
                  imagePath = imagePicker.path;
                });
              }
            },
            child: Container(
              height: 100.0,
              width: 100.0,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.5),
                  shape: BoxShape.circle,
                  image: imagePath != null && imagePath!.isNotEmpty
                      ? DecorationImage(
                          image: FileImage(File(imagePath!)), fit: BoxFit.fill)
                      : null),
              child: imagePath != null
                  ? null
                  : const FittedBox(
                      child: Icon(Icons.person, color: Colors.white)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (imagePath != null) productsController.submitImage(imagePath!);
            },
            style: ElevatedButton.styleFrom(
                primary: imagePath == null ? Colors.grey : Colors.green),
            child: const Text("Upload Image"),
          )
        ],
      ),
    );
  }
}
