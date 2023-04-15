import 'package:flutter/material.dart';
import 'package:tugas1/page/home_page.dart';
import 'package:tugas1/page/login_page.dart';
import 'package:tugas1/page/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 236, 238, 240),
          scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0)),
      initialRoute: "/login",
      routes: {
        "/register": (context) => RegisterPage(),
        "/login": (context) => LoginPage(
              username: username,
              password: password,
            ),
        "/home": (context) => HomePage(
              username: username,
            )
      },
    );
  }
}
