import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:safe_device/safe_device.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/core/app_bloc/app_bloc.dart';
import 'package:store_app/core/app_bloc/app_state.dart';
import 'package:store_app/core/routing/app_router.dart';
import 'package:store_app/core/theming/app_themes.dart';
import 'package:store_app/core/utils/local_notification_service.dart';
import 'package:store_app/core/DI/service_locator.dart';
import 'package:store_app/features/auth/presentation/manager/blocs/auth_bloc/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/manager/cubits/facebook_sign_in_cubit/facebook_sign_in_cubit.dart';
import 'package:store_app/features/auth/presentation/manager/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:store_app/features/home/presentation/manager/products_firestore_cubit/products_firestore_cubit.dart';
import 'package:store_app/features/order_location/presentation/manager/cubit/change_location_cubit.dart';
import 'package:store_app/features/security/presentation/views/security_blocked_view.dart';
import 'package:store_app/firebase_options_prod.dart';

import 'core/app_bloc/app_event.dart';
import 'features/home/presentation/manager/cart_cubit/cart_cubit.dart';

String? theme;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  SharedPreferences prefs = await SharedPreferences.getInstance();
//  String theme;
  theme = prefs.getString('theme') ?? 'light';

  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  setupServiceLocator();
  Stripe.publishableKey = dotenv.env['PUBLISHABLEKEY']!;

  // ApiKeys.publishableKey;
  await Stripe.instance.applySettings();

  //Bloc.observer = SimpleBlocObserver();
  await LocalNotificationService.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(theme!),
        )
      ],
      child: const StoreApp(),
    ),
  );
}

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  AppBloc? appBloc;
  bool _securityChecked = false;

  Future<void> checkDeviceSecurity() async {
    if (kIsWeb) return;

    final isJailBroken = await SafeDevice.isJailBroken;
    //final isDevMode = await SafeDevice.isDevelopmentModeEnable;

    if (isJailBroken

        //|| isDevMode

        ) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text('Security Warning'),
          content: const Text(
            'This app cannot run on rooted devices or with developer options enabled.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) => const SecurityBlockedView(),
                  ),
                  (route) => false, // يمسح كل التاريخ
                );
                // ممكن تقفل الصفحة أو تمنع الدخول
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    // isJailBroken();
    // isDeveloperOptionsEnabled();
    super.initState();
    // checkDeviceSecurity();

    appBloc = context.read<AppBloc>();
    appBloc!.add(InitEvent());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProductsFirestoreCubit>()..fetchProducts(),
        ),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => GoogleSignInCubit()),
        BlocProvider(create: (context) => FacebookSignInCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => ChangeLocationCubit()),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          if (!_securityChecked) {
            _securityChecked = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              checkDeviceSecurity();
            });
          }

          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode:
                appBloc!.theme == 'light' ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
  }
}
