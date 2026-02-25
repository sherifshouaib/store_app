import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/order_location/presentation/manager/cubit/change_location_cubit.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../order_location/presentation/views/pickup_map_widget.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({
    super.key,
  });

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  @override
  void initState() {
    super.initState();

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.read<ChangeLocationCubit>().loadLocation(user.uid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLocationCubit, ChangeLocationState>(
      builder: (context, state) {
        if (state is ChangeLocationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChangeLocationSucceed) {
          return WithLocationDelivery(
              title: state.title, subtitle: state.subtitle);
        } else if (state is ChangeLocationFailure) {
          return Text(
            state.errorMessage,
            style: const TextStyle(color: Colors.red),
          );
        } else {
          return const Text("No location selected");
        }
      },
    );
  }
}

class NoLocationDelivery extends StatelessWidget {
  const NoLocationDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "Add Delivery Location,Please",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PickupMapWidget()),
            );
          },
          child: Text(
            "Change",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: TColor.primary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}

class WithLocationDelivery extends StatelessWidget {
  const WithLocationDelivery({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    // final double price = state.totalPrice.roundToDouble();
    //   final String total =
    //       price == 0 ? "0" : "\$${(price + 8).round().toString()}";

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title == "" || subtitle == ""
                ? "Add Delivery Location,Please"
                : "$title. $subtitle",
            style: TextStyle(
                color: TColor.primary,
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PickupMapWidget()),
            );
          },
          child: Text(
            "Change",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: TColor.primary,
                fontSize: 13,
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
