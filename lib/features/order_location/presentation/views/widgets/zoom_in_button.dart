import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class ZoomInButton extends StatefulWidget {
  const ZoomInButton({super.key, required this.controller});

  final MapController controller;

                            ///this widget was stls not stfl ,but i made it stfl to dispose controller 
  @override
  State<ZoomInButton> createState() => _ZoomInButtonState();
}

class _ZoomInButtonState extends State<ZoomInButton> {
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
          await widget.controller.zoomIn();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Icon(Icons.add)),
        ),
      ),
    );
  }
}
