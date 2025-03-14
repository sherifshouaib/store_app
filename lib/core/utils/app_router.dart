import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/auth/presentation/views/auth_selection_view.dart';
import 'package:store_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/register_view.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/home/presentation/views/product_details_view.dart';
import 'package:store_app/features/settings/presentation/views/about_us_view.dart';
import 'package:store_app/features/settings/presentation/views/inbox_view.dart';
import 'package:store_app/features/settings/presentation/views/my_order_view.dart';
import 'package:store_app/features/settings/presentation/views/payment_details_view.dart';
import 'package:store_app/features/splash/presentation/views/splash_view.dart';

import '../../features/home/presentation/manager/counter_cubit/counter_cubit.dart';
import '../../features/navigate_between_screens/presentation/views/bottom_navigation_page_view.dart';
import '../../features/navigate_between_screens/presentation/views/myproducts_view.dart';
import '../../features/settings/presentation/views/notifications_view.dart';

abstract class AppRouter {
  static const kPaymentDetailsView = '/paymentDetailsView';
  static const kMyOrderView = '/myOrderView';
  static const kNotificationsView = '/notificationsView';
  static const kInboxView = '/inboxView';
  static const kAboutUsView = '/aboutUsView';
  static const kBottomNavigationPage = '/bottomNavigationPage';
  static const kAuthSelectionView = '/authSelection';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kHomeView = '/homeView';
  static const kProductDetailsView = '/productDetailsView';
  static const kMyProductsView = '/myProductsView';
  static const kSplashView = '/splashView';
  static const kForgotPassView = '/forgotPassView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kForgotPassView,
        builder: (context, state) =>  ForgotPassView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kBottomNavigationPage,
        builder: (context, state) => const BottomNavigationPage(),
      ),
      GoRoute(
        path: kAuthSelectionView,
        builder: (context, state) => const AuthSelectionView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kPaymentDetailsView,
        builder: (context, state) => const PaymentDetailsView(),
      ),
      GoRoute(
        path: kMyOrderView,
        builder: (context, state) => const MyOrderView(),
      ),
      GoRoute(
        path: kNotificationsView,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: kInboxView,
        builder: (context, state) => const InboxView(),
      ),
      GoRoute(
        path: kAboutUsView,
        builder: (context, state) => const AboutUsView(),
      ),
      GoRoute(
        path: kMyProductsView,
        builder: (context, state) => BlocProvider(
          create: (context) => CounterCubit(),
          child: const MyProductsView(),
        ),
      ),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => ProductDetailsCubit(getIt.get<HomeRepoImpl>()),
          child: const ProductDetailsView(
              //  product: state.extra as ProductModel,
              ),
        ),
      ),
    ],
  );
}
