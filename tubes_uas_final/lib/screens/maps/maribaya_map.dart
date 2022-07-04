import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MaribayaMap extends StatefulWidget {
  const MaribayaMap({Key? key}) : super(key: key);

  @override
  State<MaribayaMap> createState() => _MaribayaMapState();
}

class _MaribayaMapState extends State<MaribayaMap> {
  //inisialisasi controller untuk map, dan untuk posisi awal kamera di latlng sekian..
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(-6.829466,107.6489669);

  //inisialisasi controller untuk map ke googlemap controller supaya map leluasa digerakan
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Maribaya"),
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
