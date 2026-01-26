import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class ZoomOutButton extends StatefulWidget {
  const ZoomOutButton({super.key, required this.controller});

  final MapController controller;
                           ///this widget was stls not stfl ,but i made it stfl to dispose controller 
  @override
  State<ZoomOutButton> createState() => _ZoomOutButtonState();
}

class _ZoomOutButtonState extends State<ZoomOutButton> {
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
    return Padding(
      padding: EdgeInsets.all(5),
      child: InkWell(
        onTap: () async {
          await widget.controller.zoomOut();
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
