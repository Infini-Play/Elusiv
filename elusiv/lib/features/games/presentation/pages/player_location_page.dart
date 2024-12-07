import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class PlayerLocationPage extends StatefulWidget {
  const PlayerLocationPage({super.key});

  @override
  _PlayerLocationPageState createState() => _PlayerLocationPageState();
}

class _PlayerLocationPageState extends State<PlayerLocationPage> {
  GoogleMapController? _mapController;
  final Location _location = Location();
  LatLng? _playerLocation;

  @override
  void initState() {
    super.initState();
    _setupLocation();
  }

  void _setupLocation() async {
    // Request location permissions
    var hasPermission = await _location.requestPermission();
    if (hasPermission == PermissionStatus.granted) {
      _location.onLocationChanged.listen((LocationData locationData) {
        setState(() {
          _playerLocation = LatLng(locationData.latitude!, locationData.longitude!);
        });

        _mapController?.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(locationData.latitude!, locationData.longitude!),
          ),
        );
      });
    } else {
      print('Location permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Location on Map'),
      ),
      body: _playerLocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _playerLocation!,
                zoom: 15,
              ),
              onMapCreated: (controller) {
                _mapController = controller;
              },
              markers: _playerLocation != null
                  ? {
                      Marker(
                        markerId: const MarkerId('player_marker'),
                        position: _playerLocation!,
                        infoWindow: const InfoWindow(
                          title: 'Your Location',
                        ),
                      ),
                    }
                  : {},
            ),
    );
  }
}
