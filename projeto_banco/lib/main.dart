import 'package:flutter/material.dart';
import 'package:projeto_banco/pages/login.pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(title: 'Banco JJHT'),

    );
  }
}
