import 'package:flutter/material.dart';
import 'package:tubes_uas_final/profile/profile_screen.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_dago_screen.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_lembang_screen.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_maribaya_screen.dart';
import '/screens/home/view.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final username = FirebaseAuth.instance.currentUser!;
  late TextEditingController namaController;
  var namaKu =FirebaseAuth.instance.currentUser!.email.toString().split('@');
  //inisialisasi controlller unutuk firebase

  @override
  void initState() {
    namaController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
 // listen setiap perubahan terjadi dan mengubah state
    super.initState();
  }

  @override
  void dispose() {
    namaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: const CircleAvatar(
                radius: 25.0,
                backgroundImage: AssetImage("lib/images/gigachad_arabic.jpg"),
              ),
            ),
            const SizedBox(width: 10.0),
            Text(namaKu[0]),

          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Maribaya
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WisataMaribayaScreen()),
                );
              },
              child: ListCard(
                title: 'Maribaya',
                rating: '4.5',
                time: '35 min',
                thumbnailUrl: 'https://images.unsplash.com/photo-1507777767380-68bdac55c642?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
              ),
            ),
            //Lembang
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WisataLembangScreen()),
                );
              },
              child: ListCard(
                title: 'Lembang',
                rating: '4.8',
                time: '30 min',
                thumbnailUrl:
                'https://images.unsplash.com/photo-1623484281224-a9cec749c2d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=850&q=80',
              ),
            ),
            //Dago
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WisataDagoScreen()),
                );
              },
              child: ListCard(
                title: 'Dago',
                rating: '4.6',
                time: '1 hour',
                thumbnailUrl:
                'https://images.unsplash.com/photo-1642229320334-8efe5fb3594a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1073&q=80',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
