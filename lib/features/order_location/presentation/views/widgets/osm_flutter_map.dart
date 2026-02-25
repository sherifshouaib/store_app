import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class OSMFlutterMap extends StatefulWidget {
  const OSMFlutterMap({super.key, required this.controller});

  final MapController controller;

  ///this widget was stls not stfl ,but i made it stfl to dispose controller
  ///
  @override
  State<OSMFlutterMap> createState() => _OSMFlutterMapState();
}

class _OSMFlutterMapState extends State<OSMFlutterMap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: widget.controller,
      osmOption: OSMOption(
        userTrackingOption: const UserTrackingOption(
          enableTracking: false,
          unFollowUser: false,
        ),
        zoomOption: const ZoomOption(
          initZoom: 8,
          minZoomLevel: 3,
          maxZoomLevel: 19,
          stepZoom: 1.0,
        ),

        userLocationMarker: UserLocationMaker(
          personMarker: const MarkerIcon(
            icon: Icon(
              Icons.location_history_rounded,
              color: Colors.red,
              size: 48,
            ),
          ),
          directionArrowMarker: const MarkerIcon(
            icon: Icon(Icons.double_arrow, size: 48),
          ),
        ),
        roadConfiguration: const RoadOption(roadColor: Colors.yellowAccent),
        // markerOption: MarkerOption(
        //   defaultMarker: MarkerIcon(
        //     icon: Icon(Icons.person_pin_circle, color: Colors.blue, size: 56),
        //   ),
        // ),
      ),
    );
  }
}
