import 'package:flutter/material.dart';
import 'package:tubes_uas_final/screens/home/view.dart';
import 'package:tubes_uas_final/screens/maps/lembang_map.dart';
import 'package:tubes_uas_final/screens/video_screens/lembang_video_screen.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_dago_screen.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_maribaya_screen.dart';

class WisataLembangScreen extends StatefulWidget {
  const WisataLembangScreen({Key? key}) : super(key: key);

  @override
  State<WisataLembangScreen> createState() => _WisataLembangScreenState();
}

class _WisataLembangScreenState extends State<WisataLembangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wisata"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // gambar cover wisata lembang
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage('https://images.unsplash.com/photo-1623484281224-a9cec749c2d5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=850&q=80',),
                ),
              ),
            ),

            // judul
            Container(
              margin: const EdgeInsets.all(16.0),
              child: const Text("Lembang", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black), textAlign: TextAlign.center,),
            ),

            // lihat ke peta
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const LembangMap()),
                  );
                },
                child: const Center(
                  child: Text("Lihat pada Peta", style: TextStyle(color: Colors.blue,
                  ),),
                ),
              ),
            ),

            // keterangan tambahan wisata
            Container(
              margin: const EdgeInsets.symmetric(vertical: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.star_border_outlined, size: 30.0,),
                      SizedBox(height: 8.0),
                      Text("4.8", style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.time_to_leave),
                      SizedBox(height: 8.0),
                      Text("30 min", style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text("30.000", style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ],
              ),
            ),

            // deskripsi wisata
            Container(
              margin: const EdgeInsets.all(16.0),
              child: const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                style: TextStyle(fontSize: 15.0, color: Colors.black), textAlign: TextAlign.center,),
            ),

            // lihat video youtube
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LembangVideoScreen()),
                  );
                },
                child: const Center(
                  child: Text("Lihat Video", style: TextStyle(color: Colors.blue,
                  ),),
                ),
              ),
            ),

            // kasih jarak antara atas bawah setinggi 20 px
            SizedBox(height: 20),

            // list card wisata lain
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
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
            ),
          ],
        ),
      ),
    );
  }
}
