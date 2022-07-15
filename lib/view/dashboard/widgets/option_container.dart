import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 90.0,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Row(
          children: [
            Icon(iconData, color: Colors.yellow, size: 36.0),
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
