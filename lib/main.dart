import 'package:flutter/material.dart';
import 'package:vendor/view/config/theme.dart';
import 'package:vendor/view/dashboard/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vendor',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      home: const DashBoardScreen(),
    );
  }
}
