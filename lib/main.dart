import 'package:flutter/material.dart';
import 'package:retrofit_study/page/news_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrofit Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewsListPage(),
    );
  }
}
