import 'package:flutter/material.dart';
import 'package:tubes_uas_final/screens/home/view.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../wisata/wisata_lembang_screen.dart';
import '../wisata/wisata_maribaya_screen.dart';

class DagoVideoScreen extends StatefulWidget {
  const DagoVideoScreen({Key? key}) : super(key: key);

  @override
  State<DagoVideoScreen> createState() => _DagoVideoScreenState();
}

class _DagoVideoScreenState extends State<DagoVideoScreen> {
  //inisialisasi controller untuk youtube player
  late YoutubePlayerController controller;

  //mekanisme untuk melepaskan memori yg dialokasikan ke variabel saat objek dihapus secara permanen atau untuk sementara
  void deactive() {
    controller.pause();
    super.deactivate();
  }

  //mekanisme untuk melepaskan memori yg dialokasikan ke variabel saat objek dihapus secara permanen
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // inisialisasi ketika halaman di jalankan atau pada state running, akan melakukan perintah dibawah
  void initState() {
    const url = "https://youtu.be/bE1tdie_ldo";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        hideControls: true,
      ),
      // untuk selalu melisten input dari user dan melakukan perubahan menggunakan setstate
    )..addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Wisata Dago"),
          ),
          body: ListView(
            children: [
              // menampilkan objek video youtube
              player,

              // kasih jarak antara atas bawah setinggi 16 px
              SizedBox(height: 16,),

              // controller untuk melakukan pause atau play
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  child: Text(controller.value.isPlaying? "Pause" : "Play" ),
                  onPressed: () {
                    if (controller.value.isPlaying) {
                      controller.pause();
                    } else {
                      controller.play();
                    }
                  },
                ),
              ),

              // teks cek wisata lainnya
              Container(
                padding: EdgeInsets.all(15),
                child: Text("Cek Wisata Lainnya",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
              ),

              // list card wisata lainnya
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          controller.pause();
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
                          controller.pause();
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
