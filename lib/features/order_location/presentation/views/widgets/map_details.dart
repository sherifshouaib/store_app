import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'osm_flutter_map.dart';
import 'zoom_in_button.dart';
import 'zoom_out_button.dart';

class MapDetails extends StatelessWidget {
  const MapDetails({super.key, required this.controller});

  final MapController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Stack(
        children: [
          OSMFlutterMap(controller: controller),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ZoomInButton(controller: controller),
                ZoomOutButton(controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
