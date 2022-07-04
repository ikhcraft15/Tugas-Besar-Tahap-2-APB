import 'package:flutter/material.dart';
import 'package:tubes_uas_final/screens/home/view.dart';
import 'package:tubes_uas_final/screens/maps/maribaya_map.dart';
import 'package:tubes_uas_final/screens/video_screens/maribaya_video_screen.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_dago_screen.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_lembang_screen.dart';

class WisataMaribayaScreen extends StatefulWidget {
  const WisataMaribayaScreen({Key? key}) : super(key: key);

  @override
  State<WisataMaribayaScreen> createState() => _WisataMaribayaScreenState();
}

class _WisataMaribayaScreenState extends State<WisataMaribayaScreen> {
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
            // gambar cover wisata maribaya
            Container(
              width: MediaQuery.of(context).size.width,
              height: 280,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://images.unsplash.com/photo-1507777767380-68bdac55c642?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',"),
                ),
              ),
            ),

            // judul
            Container(
              margin: const EdgeInsets.all(16.0),
              child: const Text("Maribaya", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.black), textAlign: TextAlign.center,),
            ),

            // lihat ke peta
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const MaribayaMap()),
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
                      Text("4.5", style: TextStyle(color: Colors.black),),
                    ],
                  ),
                  Column(
                    children: const [
                      Icon(Icons.time_to_leave),
                      SizedBox(height: 8.0),
                      Text("35 min", style: TextStyle(color: Colors.black),),
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
              child: const Text("Maribaya adalah kawasan wisata alam yang dulunya terkenal dengan pemandian air panasnya. Tapi saat ini yang paling dikenal adalah adanya curug / air terjun yang ada di beberapa tempat di lokasi ini. Yang juga menarik adalah curug ini dipasang jembatan di atasnya. Sehingga kita bisa melihat langsung air yang terjun deras ke bawah tepat dari atasnya.",
                style: TextStyle(fontSize: 15.0, color: Colors.black), textAlign: TextAlign.center,),
            ),

            // lihat video youtube
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MaribayaVideoScreen()),
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
