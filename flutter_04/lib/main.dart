import 'package:flutter/material.dart';
import 'package:flutter_04/bai3.dart';
import 'package:flutter_04/baitap2.dart';

import 'example.dart';
import 'baitap1.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examples',
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: LoginScreen(),

    );
  }
}