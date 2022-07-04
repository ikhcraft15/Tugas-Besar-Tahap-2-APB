import 'package:flutter/material.dart';
import 'package:tubes_uas_final/apps/healing_time.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //inisialisasi Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //menjalankan aplikasi "healing time"
  runApp(const Healing_Time());
}