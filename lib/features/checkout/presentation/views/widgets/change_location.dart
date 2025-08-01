import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/order_location/presentation/manager/cubit/change_location_cubit.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../order_location/presentation/views/pickup_map_widget.dart';

class ChangeLocation extends StatelessWidget {
  const ChangeLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeLocationCubit(),
      child: BlocBuilder<ChangeLocationCubit, ChangeLocationState>(
        builder: (context, state) {
          if (state is ChangeLocationInitial) {
            return NoLocationDelivery();
            // state.title1 = 'Add Delivery Location,Please';
          } else {
            return WithLocationDelivery();
          }
        },
      ),
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
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}

class WithLocationDelivery extends StatelessWidget {
  const WithLocationDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String title = BlocProvider.of<ChangeLocationCubit>(context).title1;

    String subtitle = BlocProvider.of<ChangeLocationCubit>(context).subtitle1;
    print(title);
    print(subtitle);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "$title.\n$subtitle",
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
                fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
