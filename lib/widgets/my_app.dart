import 'package:flutter/material.dart';
import 'package:tech_news/widgets/home.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pixels news',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Pixels news'),
    );
  }
}