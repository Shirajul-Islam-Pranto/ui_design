import 'package:flutter/material.dart';
import 'package:ui_design/features/nav_bar/category/screen/category_screen.dart';
import 'package:ui_design/features/nav_bar/home/screen/home_page.dart';
import 'package:ui_design/features/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   CategoryScreen( ),
    );
  }
}
