import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:store_app/features/order_location/presentation/manager/cubit/change_location_cubit.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key, required this.controller});

  final MapController controller;
                           ///this widget was stls not stfl ,but i made it stfl to dispose controller 

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
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
    return TypeAheadField<SearchInfo>(
      suggestionsCallback: (search) => addressSuggestion(search),
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            isDense: true,
            contentPadding: EdgeInsets.all(10),
            labelText: 'Address',
          ),
        );
      },
      itemBuilder: (context, address) {
        // var changeLocation = BlocProvider.of<ChangeLocationCubit>(context);
        // changeLocation.ChangeLocation(
        //   title: address.address!.name!,
        //   subtitle: address.address!.country!,
        // );

        return ListTile(
          title: Text(address.address!.name!),
          subtitle: Text(address.address!.country!),
        );
      },
      onSelected: (address) async {
        //  debugPrint(address.address!.name);

        final uid = FirebaseAuth.instance.currentUser!.uid;

        context.read<ChangeLocationCubit>().changeLocation(
              uid: uid,
              title: address.address!.name!,
              subtitle: address.address!.country!,
            );

        await widget.controller.moveTo(address.point!, animate: true);

        await widget.controller.addMarker(
          address.point!,
          markerIcon: MarkerIcon(
            icon: Icon(Icons.location_pin, color: Colors.red, size: 100),
          ),
          // angle: pi / 3,
          //  anchor: IconAnchor(anchor: Anchor.top),
        );
      },
    );
  }
}




// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:store_app/features/order_location/presentation/manager/cubit/change_location_cubit.dart';

// class SearchTextField extends StatefulWidget {
//   const SearchTextField({super.key, required this.controller});

//   final MapController controller;
//                            ///this widget was stls not stfl ,but i made it stfl to dispose controller 

//   @override
//   State<SearchTextField> createState() => _SearchTextFieldState();
// }

// class _SearchTextFieldState extends State<SearchTextField> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     widget.controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField<SearchInfo>(
//       suggestionsCallback: (search) => addressSuggestion(search),
//       builder: (context, controller, focusNode) {
//         return TextField(
//           controller: controller,
//           focusNode: focusNode,
//           autofocus: true,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             isDense: true,
//             contentPadding: EdgeInsets.all(10),
//             labelText: 'Address',
//           ),
//         );
//       },
//       itemBuilder: (context, address) {
//         // var changeLocation = BlocProvider.of<ChangeLocationCubit>(context);
//         // changeLocation.ChangeLocation(
//         //   title: address.address!.name!,
//         //   subtitle: address.address!.country!,
//         // );

//         return ListTile(
//           title: Text(address.address!.name!),
//           subtitle: Text(address.address!.country!),
//         );
//       },
//       onSelected: (address) async {
//         //  debugPrint(address.address!.name);

//         final uid = FirebaseAuth.instance.currentUser!.uid;

//         context.read<ChangeLocationCubit>().changeLocation(
//               uid: uid,
//               title: address.address!.name!,
//               subtitle: address.address!.country!,
//             );

//         await widget.controller.moveTo(address.point!, animate: true);

//         await widget.controller.addMarker(
//           address.point!,
//           markerIcon: MarkerIcon(
//             icon: Icon(Icons.location_pin, color: Colors.red, size: 100),
//           ),
//           // angle: pi / 3,
//           //  anchor: IconAnchor(anchor: Anchor.top),
//         );
//       },
//     );
//   }
// }



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:store_app/features/order_location/presentation/manager/cubit/change_location_cubit.dart';

// class SearchTextField extends StatefulWidget {
//   const SearchTextField({super.key, required this.controller});

//   final MapController controller;
//                            ///this widget was stls not stfl ,but i made it stfl to dispose controller 

//   @override
//   State<SearchTextField> createState() => _SearchTextFieldState();
// }

// class _SearchTextFieldState extends State<SearchTextField> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     widget.controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField<SearchInfo>(
//       suggestionsCallback: (search) => addressSuggestion(search),
//       builder: (context, controller, focusNode) {
//         return TextField(
//           controller: controller,
//           focusNode: focusNode,
//           autofocus: true,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//             ),
//             isDense: true,
//             contentPadding: EdgeInsets.all(10),
//             labelText: 'Address',
//           ),
//         );
//       },
//       itemBuilder: (context, address) {
//         // var changeLocation = BlocProvider.of<ChangeLocationCubit>(context);
//         // changeLocation.ChangeLocation(
//         //   title: address.address!.name!,
//         //   subtitle: address.address!.country!,
//         // );

//         return ListTile(
//           title: Text(address.address!.name!),
//           subtitle: Text(address.address!.country!),
//         );
//       },
//       onSelected: (address) async {
//         //  debugPrint(address.address!.name);

//         final uid = FirebaseAuth.instance.currentUser!.uid;

//         context.read<ChangeLocationCubit>().changeLocation(
//               uid: uid,
//               title: address.address!.name!,
//               subtitle: address.address!.country!,
//             );

//         await widget.controller.moveTo(address.point!, animate: true);

//         await widget.controller.addMarker(
//           address.point!,
//           markerIcon: MarkerIcon(
//             icon: Icon(Icons.location_pin, color: Colors.red, size: 100),
//           ),
//           // angle: pi / 3,
//           //  anchor: IconAnchor(anchor: Anchor.top),
//         );
//       },
//     );
//   }
// }
