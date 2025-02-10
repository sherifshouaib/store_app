import 'package:go_router/go_router.dart';
import 'package:store_app/features/auth/presentation/views/auth_selection_view.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';
import 'package:store_app/features/home/presentation/views/product_details_view.dart';
import 'package:store_app/features/settings/presentation/views/about_us_view.dart';
import 'package:store_app/features/settings/presentation/views/inbox_view.dart';
import 'package:store_app/features/settings/presentation/views/my_order_view.dart';
import 'package:store_app/features/settings/presentation/views/payment_details_view.dart';

import '../../features/navigate_between_screens/presentation/views/bottom_navigation_page_view.dart';
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



  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
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
        path: kBottomNavigationPage,
        builder: (context, state) => const BottomNavigationPage(),
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
        path: kProductDetailsView,
        builder: (context, state) => const ProductDetailsView(),
      ),
    ],
  );
}
