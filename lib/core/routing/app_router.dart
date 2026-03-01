import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/DI/service_locator.dart';
import 'package:store_app/features/auth/presentation/views/auth_selection_view.dart';
import 'package:store_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:store_app/features/auth/presentation/views/login_view.dart';
import 'package:store_app/features/auth/presentation/views/register_view.dart';
import 'package:store_app/features/checkout/presentation/views/my_cart_view.dart';
import 'package:store_app/features/checkout/presentation/views/payment_details_view.dart';
import 'package:store_app/features/checkout/presentation/views/thank_you_view.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/manager/product_details_cubit/product_details_cubit.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/home/presentation/views/product_details_view.dart';
import 'package:store_app/features/profile/presentation/views/profile_view.dart';
import 'package:store_app/features/settings/presentation/views/about_us_view.dart';
import 'package:store_app/features/settings/presentation/views/dark_and_light_mode_view.dart';
import 'package:store_app/features/settings/presentation/views/inbox_view.dart';
import 'package:store_app/features/settings/presentation/views/my_order_view.dart';
import 'package:store_app/features/settings/presentation/views/settings_view.dart';
import 'package:store_app/features/settings/presentation/views/widgets/settings_list_view_item.dart';
import 'package:store_app/features/splash/presentation/views/splash_view.dart';

import '../../features/auth/presentation/views/verify_email_view.dart';
import '../../features/home/presentation/manager/counter_cubit/counter_cubit.dart';
import '../../features/navigate_between_screens/presentation/views/bottom_navigation_page_view.dart';
import '../../features/navigate_between_screens/presentation/views/myproducts_view.dart';
import '../../features/settings/presentation/views/notifications_view.dart';

abstract class AppRouter {
  static const kMyOrderView = '/myOrderView';
  static const kNotificationsView = '/notificationsView';
  static const kDarkAndLightModeView = '/darkAndLightModeView';
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
  static const kVerifyEmailView = '/verifyEmailView';
  static const kProfileView = '/profileView';
  static const kUploadArea = '/uploadArea';
  static const kMyCartView = '/myCartView';
  static const kPaymentDetailsView = '/paymentDetailsView';
  static const kThankYouView = '/thankyouview';
  // static const kSettingsView = '/settingsView';

  // static const kGoogleMapsView = '/googlemapsview';
  static final _auth = FirebaseAuth.instance;

  static final router = GoRouter(
    refreshListenable: GoRouterRefreshStream(
      _auth.authStateChanges(),
    ),
    redirect: (context, state) {
      final user = _auth.currentUser;
      final isSplash = state.matchedLocation == '/';

      final isAuthPage = state.matchedLocation == kLoginView ||
          state.matchedLocation == kRegisterView ||
          state.matchedLocation == kForgotPassView;

      final isVerifyPage = state.matchedLocation == kVerifyEmailView;

      // 🟣 اسمح للـ Splash تفتح دايمًا
      if (isSplash) return null;

      // 🔴 لو مفيش user
      if (user == null) {
        return isAuthPage ? null : kLoginView;
      }

      // 🟡 لو user موجود لكن الايميل مش متفعل
      if (!user.emailVerified) {
        return isVerifyPage ? null : kVerifyEmailView;
      }

      // 🟢 لو user متفعل
      if (user.emailVerified && (isAuthPage || isVerifyPage)) {
        return kBottomNavigationPage;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      // GoRoute(
      //   path: kPaymentDetailsView,
      //   builder: (context, state) => const PaymentDetailsView(),
      // ),

      // GoRoute(
      //   path: kSettingsView,
      //   builder: (context, state) => StreamBuilder(
      //     stream: FirebaseAuth.instance.authStateChanges(),

      //     builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
      //       final user = FirebaseAuth.instance.currentUser;

      //       if ((user == null ||
      //           SettingsListViewItem.googleSignIn.currentUser == null)) {
      //         return const LoginView();
      //       } else {
      //         return const SettingsView();
      //       }
      //     },
      //     //  child: const SettingsView()),
      //   ),
      // ),

      GoRoute(
        path: kThankYouView,
        builder: (context, state) => const ThankYouView(),
      ),

      GoRoute(
        path: kMyCartView,
        builder: (context, state) => const MyCartView(),
      ),

      GoRoute(
        path: kProfileView,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kVerifyEmailView,
        builder: (context, state) => VerifyEmailView(),
      ),
      GoRoute(
        path: kForgotPassView,
        builder: (context, state) => const ForgotPassView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const BottomNavigationPage(),
      // ),
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
        path: kDarkAndLightModeView,
        builder: (context, state) => const DarkAndLightModeView(),
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

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
