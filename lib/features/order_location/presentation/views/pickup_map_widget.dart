import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

import '../../../../core/utils/colors.dart';
import 'widgets/map_details.dart';
import 'widgets/search_text_field.dart';

class PickupMapWidget extends StatefulWidget {
  const PickupMapWidget({super.key});

  @override
  State<PickupMapWidget> createState() => _PickupMapWidgetState();
}

class _PickupMapWidgetState extends State<PickupMapWidget> {
  final controller = MapController.withUserPosition(
    trackUserLocation: const UserTrackingOption(
      enableTracking: false,
      unFollowUser: false,
    ),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: false, title: Text('Pick Up Location ')),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          SearchTextField(controller: controller),
          const SizedBox(height: 10),
          MapDetails(controller: controller),
          const SizedBox(height: 20),
          SavedLocations(),
        ],
      ),
    );
  }
}

class SavedLocations extends StatelessWidget {
  const SavedLocations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset('assets/images/fav_icon.png', width: 35, height: 35),
      const SizedBox(
        width: 8,
      ),
      Expanded(
        child: Text(
          "Choose a saved place",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
      ),
      Image.asset(
        'assets/images/btn_next.png',
        width: 15,
        height: 15,
        color: TColor.primaryText,
      )
    ]);
  }
}
