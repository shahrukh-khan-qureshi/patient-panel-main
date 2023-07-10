import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => LocationState();
}

class LocationState extends State<Location> {
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  final Map<String, Marker> _markers = {};
  final Map<String, Polyline> _polylines = {}; // Add this
  final List<LatLng> _polylineCoordinates = []; // Add this

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.582045, 74.329376),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(_markers.values),
          polylines: Set<Polyline>.of(_polylines.values), // Add this
        ),
      ),
    );
  }

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition();

    LatLng currentPosition = LatLng(position.latitude, position.longitude);
    LatLng destinationPosition = LatLng(31.582045, 74.329376);

    addMarker("current_location", currentPosition);
    addMarker("destination", destinationPosition);

    _polylineCoordinates.add(currentPosition); // Add this
    _polylineCoordinates.add(destinationPosition); // Add this

    addPolyline("route", _polylineCoordinates); // Add this
  }

  void addMarker(String markerId, LatLng location) {
    final Marker marker = Marker(
      markerId: MarkerId(markerId),
      position: location,
      infoWindow: InfoWindow(
        title: (markerId == 'current_location')
            ? "Current location"
            : "Destination",
        snippet: 'Lat: ${location.latitude}, Lng: ${location.longitude}',
      ),
    );
    setState(() {
      _markers[markerId] = marker;
    });
  }

  void addPolyline(String polylineId, List<LatLng> polylineCoordinates) {
    final Polyline polyline = Polyline(
      polylineId: PolylineId(polylineId),
      color: Colors.red,
      points: polylineCoordinates,
      width: 2,
    );
    setState(() {
      _polylines[polylineId] = polyline;
    });
  }
}
