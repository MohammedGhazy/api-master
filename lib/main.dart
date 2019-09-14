import 'package:flutter/material.dart';
import 'package:api/home.dart';
import 'package:api/post.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'api',
      debugShowCheckedModeBanner: false,
      home: PostScreen(),
    );
  }
}
