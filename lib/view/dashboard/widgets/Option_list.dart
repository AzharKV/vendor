import 'package:flutter/material.dart';
import 'package:vendor/view/dashboard/widgets/bottom_sheet_data_widget.dart';

class OptionList extends StatelessWidget {
  const OptionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.keyboard_arrow_down),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            children: const [
              BottomSheetDataWidget(title: "Profile", iconData: Icons.person),
              BottomSheetDataWidget(
                  title: "Privacy Policy", iconData: Icons.policy_outlined),
              BottomSheetDataWidget(
                  title: "Terms & Conditions",
                  iconData: Icons.note_add_rounded),
              BottomSheetDataWidget(
                  title: "Support", iconData: Icons.contact_support),
              BottomSheetDataWidget(
                  title: "Logout", iconData: Icons.logout, isBlackColor: false),
            ],
          ),
        ],
      ),
    );
  }
}
