import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();

  // This widget is the root of your application.
}

class _MyAppState extends State<MyApp>{
  late Completer<GoogleMapController> mapController = Completer();
  final LatLng _center = const LatLng(46.8188, -92.0843);

  final Set<Marker> _pins = {};

  final List<Marker> _list = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(46.76878126039316, -92.12193314473328),
      infoWindow: InfoWindow(title: "OMC Smokeouse")
    ),
    const Marker(
        markerId: MarkerId('2'),
        position: LatLng(46.78740190160272, -92.09744466986929),
        infoWindow: InfoWindow(title: "Pizza Lucé")
    ),
    const Marker(
        markerId: MarkerId('3'),
        position: LatLng(46.78276534664943, -92.09558242144593),
        infoWindow: InfoWindow(title: "Adventure Zone")
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pins.addAll(_list);
  }

  void _onMapCreated(GoogleMapController controller){
    // mapController.complete(controller);
    mapController = controller as Completer<GoogleMapController>;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _pins,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0
          ),
        ),
      ),
    );
  }

}

