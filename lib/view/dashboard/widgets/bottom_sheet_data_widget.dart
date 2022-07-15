import 'package:flutter/material.dart';

class BottomSheetDataWidget extends StatelessWidget {
  const BottomSheetDataWidget(
      {Key? key,
      required this.iconData,
      required this.title,
      this.isBlackColor = true})
      : super(key: key);

  final IconData iconData;
  final String title;
  final bool isBlackColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 65.0,
        child: Column(
          children: [
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                  color:
                      isBlackColor ? Colors.black.withOpacity(0.7) : Colors.red,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Icon(iconData,
                  color: isBlackColor ? Colors.yellow : Colors.white),
            ),
            const SizedBox(height: 4.0),
            Text(
              title,
              style: const TextStyle(fontSize: 11.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
