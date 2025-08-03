import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:store_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:store_app/features/checkout/presentation/views/widgets/order_info_items.dart';
import 'package:store_app/features/checkout/presentation/views/widgets/total_price_widget.dart';

import '../../../../../core/buttons/custom_button.dart';
import '../../../../../core/utils/colors.dart';
import 'change_location.dart';
import 'payment_methods_bottom_sheet.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Delivery Address",
              textAlign: TextAlign.center,
              style: TextStyle(color: TColor.secondaryText, fontSize: 12),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ChangeLocation(),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Image.asset('assets/images/basket_image.png'),
          ),
          const OrderInfoItems(),
          const SizedBox(
            width: 25,
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              // GoRouter.of(context).push(
              //   AppRouter.kPaymentDetailsView,
              // );
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
