import 'package:flutter/material.dart';
import 'package:tubes_uas_final/screens/home/auth_screen.dart';

class Healing_Time extends StatelessWidget {
  const Healing_Time({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreenAuth(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
