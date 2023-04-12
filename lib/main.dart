import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 화면에 디버그 제거
      home: Scaffold(
        body: Container(
          child: const Center(child: Text("테스1111트2fef222")),
        ),
      ), // 클래스 분리
    );
  }
}
