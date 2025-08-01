import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/api_keys.dart';
import 'package:store_app/core/utils/local_notification_service.dart';
import 'package:store_app/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:store_app/features/checkout/data/models/amount_model/details.dart';
import 'package:store_app/features/checkout/data/models/item_list_model/item.dart';
import 'package:store_app/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:store_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:store_app/features/checkout/presentation/manager/cubit/payment_cubit.dart';

import '../../../../../core/buttons/custom_button.dart';
import '../../../../../core/utils/app_router.dart';
import 'payment_methods_list_view.dart';

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
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                      amount: '100',
                      currency: 'USD',
                      customerId: 'cus_SFj36u4d9CleY3');

              var transactionsData = getTransactionsData();
              LocalNotificationService.showBasicNotification();

              PaymentMethodsListView.activeIndex ==
                      1 // ال3 سطور دول هم اللى كانوا موقفين تشغيل الدفع
                  ? executePaypalPayment(context, transactionsData)
                  : BlocProvider.of<PaymentCubit>(context).makePayment(
                      paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoading: state is PaymentLoading ? true : false,
            text: 'Continue');
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalsecretKey,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionsData.itemList.toJson(),
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
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amount = AmountModel(
      total: "100",
      currency: 'USD',
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: '100',
      ),
    );

    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "4",
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: "5",
        quantity: 12,
      ),
    ];

    var itemList = ItemListModel(
      orders: orders,
    );
    return (amount: amount, itemList: itemList);
  }
}
