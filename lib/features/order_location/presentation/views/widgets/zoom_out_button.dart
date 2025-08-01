

import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class ZoomOutButton extends StatelessWidget {
  const ZoomOutButton({super.key, required this.controller});

  final MapController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () async {
          await controller.zoomOut();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Icon(Icons.remove)),
        ),
      ),
    );
  }
}
