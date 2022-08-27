
import 'package:flutter/material.dart';

import 'package:flutter_newsapp/screens/news_app.dart';
import 'package:flutter_newsapp/service/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
