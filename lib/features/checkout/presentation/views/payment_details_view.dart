import 'package:flutter/material.dart';
import 'package:store_app/core/buttons/custom_appbar.dart';
import 'package:store_app/features/checkout/presentation/views/widgets/payments_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: const PaymentsDetailsViewBody(),
    );
  }
}
