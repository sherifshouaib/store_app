import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/buttons/custom_button.dart';
import 'package:store_app/core/utils/app_router.dart';

import 'custom_credit_card.dart';
import 'payment_methods_list_view.dart';

class PaymentsDetailsViewBody extends StatefulWidget {
  const PaymentsDetailsViewBody({super.key});

  @override
  State<PaymentsDetailsViewBody> createState() =>
      _PaymentsDetailsViewBodyState();
}

class _PaymentsDetailsViewBodyState extends State<PaymentsDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: PaymentMethodsListView(),
        ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formKey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 12,
                left: 16,
                right: 16,
              ),
              child: CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    log('payment');
                  } else {
                    GoRouter.of(context).push(
                      AppRouter.kThankYouView,
                    );
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: 'Payment',
              ),
            ),
          ),
        )
      ],
    );
  }
}
