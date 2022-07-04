import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tubes_uas_final/screens/home/home_screen.dart';
import 'package:tubes_uas_final/screens/login/login_screen.dart';

class HomeScreenAuth extends StatefulWidget {
  const HomeScreenAuth({Key? key}) : super(key: key);

  @override
  State<HomeScreenAuth> createState() => _HomeScreenAuthState();
}

class _HomeScreenAuthState extends State<HomeScreenAuth> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // mengecek apakah ada user terdaftar, kalau tidak ada maka hanya akan menetap di layar loginScreen(), atau semisal ada
          // dilempar ke homeScreen()
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
