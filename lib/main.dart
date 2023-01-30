import 'package:restapi/ui/add_page.dart';
import 'package:restapi/ui/edit_page.dart';
import 'package:restapi/ui/home_page.dart';
import 'package:restapi/ui/login_page.dart';
import 'package:restapi/ui/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/add': (context) => const AddPage(),
        '/edit': (context) => const EditPage(),
      },
    );
  }
}
