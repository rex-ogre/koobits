import 'package:flutter/material.dart';
import 'package:koobits/config/routes.dart';
import 'package:koobits/model/quiz.dart';
import 'package:koobits/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_)=> Quiz(),
      child: MaterialApp(
        routes: routes,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen()
      ),
    );
  }
}

