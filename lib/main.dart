
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studi_kasus5/home_page.dart';
import 'package:studi_kasus5/makanan.dart';
import 'package:studi_kasus5/style.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: pageBgColor,
        appBar: AppBar(
          backgroundColor: headerBackColor,
          title: const Text("Kuliner Nusantara",
          style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: const HomePage(),
      ),
      
    );
  }
}

