import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';

//PageLoading
class PageCScreen extends StatefulWidget {
  const PageCScreen({super.key});

  @override
  _PageCScreenState createState() => _PageCScreenState();
}

class _PageCScreenState extends State<PageCScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  LatLng _currentPosition = const LatLng(0, 0);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  //Grant
  //Location Permission
  Future<bool> _handleLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
      final result = await Permission.locationWhenInUse.request();
      return result.isGranted;
    }
    return true;
  }

  //Get the current location of the user
  //In here
  Future<void> _getCurrentLocation() async {
    if (await _handleLocationPermission()) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      _loadNearbyGarages(position.latitude, position.longitude);
    } else {
      // Handle the case where permission is not granted
      print("Location permission not granted");
    }
  }

  // Fetch nearby garages from Google Places API
  Future<void> _loadNearbyGarages(double lat, double lng) async {
    String apiKey = "#";//your  API Key
    String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
        '?location=$lat,$lng&radius=2000&type=car_repair&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final List<dynamic> places = result['results'];

      setState(() {
        _markers.clear();
        for (var place in places) {
          final marker = Marker(
            markerId: MarkerId(place['place_id']),
            position: LatLng(place['geometry']['location']['lat'], place['geometry']['location']['lng']),
            infoWindow: InfoWindow(
              title: place['name'],
              snippet: place['vicinity'],
            ),
          );
          _markers.add(marker);
        }
      });
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locate the Garages'),
      ),
      body: _currentPosition.latitude == 0 && _currentPosition.longitude == 0
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 14.0,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
