import 'package:flutter/material.dart';
import 'package:vanilla_provider_application/feature/onboard/on_board_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(11, 23, 81, 1),
        ),
        // indicatorColor: const Color.fromRGBO(11, 23, 81, 1),
        // selectedRowColor: const Color.fromRGBO(11, 23, 81, 1),
      ),
      home: const OnBoardView(),
    );
  }
}
