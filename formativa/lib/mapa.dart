import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-22.9697, -46.9978),
          zoom: 16,
        ),
        markers: {Marker(markerId: MarkerId("pino"), position: LatLng(-22.9697, -46.9978)),},
      ),
    );
  }
}
