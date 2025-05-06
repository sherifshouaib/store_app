import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:store_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';

import '../../../../../core/buttons/custom_button.dart';
import '../../../../../core/utils/app_router.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          GoRouter.of(context).pushReplacement(
            AppRouter.kThankYouView,
          );
        }

        if (state is PaymentFailure) {
          GoRouter.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              // PaymentIntentInputModel paymentIntentInputModel =
              //     PaymentIntentInputModel(
              //         amount: '100',
              //         currency: 'USD',
              //         customerId: 'cus_SFj36u4d9CleY3');
              // BlocProvider.of<PaymentCubit>(context).makePayment(
              //     paymentIntentInputModel: paymentIntentInputModel);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PaypalCheckoutView(
                  sandboxMode: true,
                  clientId: "YOUR CLIENT ID",
                  secretKey: "YOUR SECRET KEY",
                  transactions: const [
                    {
                      "amount": {
                        "total": '100',
                        "currency": "USD",
                        "details": {
                          "subtotal": '100',
                          "shipping": '0',
                          "shipping_discount": 0
                        }
                      },
                      "description": "The payment transaction description.",
                      "item_list": {
                        "items": [
                          {
                            "name": "Apple",
                            "quantity": 4,
                            "price": '10',
                            "currency": "USD"
                          },
                          {
                            "name": "Pineapple",
                            "quantity": 5,
                            "price": '12',
                            "currency": "USD"
                          }
                        ],
                      }
                    }
                  ],
                  note: "Contact us for any questions on your order.",
                  onSuccess: (Map params) async {
                    log("onSuccess: $params");
                    Navigator.pop(context);
                  },
                  onError: (error) {
                    log("onError: $error");
                    Navigator.pop(context);
                  },
                  onCancel: () {
                    print('cancelled:');
                    Navigator.pop(context);
                  },
                ),
              ));
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }
}

