import 'package:dartz/dartz.dart';
import 'package:store_app/core/errors/failures.dart';
import 'package:store_app/core/networking/stripe_service.dart';
import 'package:store_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:store_app/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
