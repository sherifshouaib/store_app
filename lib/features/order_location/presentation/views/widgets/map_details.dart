import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import 'osm_flutter_map.dart';
import 'zoom_in_button.dart';
import 'zoom_out_button.dart';

class MapDetails extends StatefulWidget {
  const MapDetails({super.key, required this.controller});

  final MapController controller;

                       ///this widget was stls not stfl ,but i made it stfl to dispose controller 
  
  @override
  State<MapDetails> createState() => _MapDetailsState();
}

class _MapDetailsState extends State<MapDetails> {

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
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Stack(
        children: [
          OSMFlutterMap(controller: widget.controller),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ZoomInButton(controller: widget.controller),
                ZoomOutButton(controller: widget.controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
