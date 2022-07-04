import 'package:flutter/material.dart';
import 'package:tubes_uas_final/screens/home/view.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_dago_screen.dart';
import 'package:tubes_uas_final/screens/wisata/wisata_lembang_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MaribayaVideoScreen extends StatefulWidget {
  const MaribayaVideoScreen({Key? key}) : super(key: key);

  @override
  State<MaribayaVideoScreen> createState() => _MaribayaVideoScreenState();
}

class _MaribayaVideoScreenState extends State<MaribayaVideoScreen> {
  //inisialisasi controller untuk youtube player
  late YoutubePlayerController controller;

  //mekanisme untuk melepaskan memori yg dialokasikan ke variabel saat objek dihapus secara permanen atau untuk sementara
  void deactive() {
    controller.pause();
    super.deactivate();
  }

  //mekanisme untuk melepaskan memori yg dialokasikan ke variabel saat objek dihapus secara permanen
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  // inisialisasi ketika halaman di jalankan atau pada state running, akan melakukan perintah dibawah
  @override
  void initState() {
    const url = "https://youtu.be/BxrZirI566g";
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
    //youtubeplayerbuilder widget
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Wisata Maribaya"),
          ),
          body: ListView(
            children: [
              // menampilkan objek video youtube
              player,

              // kasih jarak antara atas bawah setinggi 16 px
              const SizedBox(height: 16,),

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
                padding: const EdgeInsets.all(15),
                child: const Text("Cek Wisata Lainnya",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                          controller.pause();
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
        );
      },
    );
  }
}
