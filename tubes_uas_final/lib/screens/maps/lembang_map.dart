import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LembangMap extends StatefulWidget {
  const LembangMap({Key? key}) : super(key: key);

  @override
  State<LembangMap> createState() => _LembangMapState();
}

class _LembangMapState extends State<LembangMap> {
  //inisialisasi controller untuk map, dan untuk posisi awal kamera di latlng sekian..
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-6.8185509,107.6252382);

  //inisialisasi controller untuk map ke googlemap controller supaya map leluasa digerakan
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lembang"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          //koordinat awal kamera
          target: _center,
          //zoom setinggi sekian dari ketinggian peta
          zoom: 15.0,
        ),
      ),
    );
  }
}
