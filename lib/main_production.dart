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
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:store_app/features/order_location/presentation/manager/cubit/change_location_cubit.dart';
import 'package:store_app/features/security/presentation/views/security_blocked_view.dart';

import 'core/app_bloc/app_event.dart';
import 'features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'firebase_options.dart';

String? theme;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  SharedPreferences prefs = await SharedPreferences.getInstance();
//  String theme;
  theme = prefs.getString('theme') ?? 'light';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
//ChangeThemeBloc? changeThemeBloc;

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

  // isJailBroken() async {
  //   if (kIsWeb) {
  //     // Web → تجاهل الفحص
  //     return;
  //   }
  //   bool isJailBroken = await SafeDevice.isJailBroken;
  //   // print(isJailBroken);
  //   if (isJailBroken) {
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         title: Text('Security Warning'),
  //         content: Text('This app cannot run on rooted devices'),
  //       ),
  //     );
  //     exit(0);
  //   }
  // }

  // isDeveloperOptionsEnabled() async {
  //   if (kIsWeb) {
  //     // Web → تجاهل الفحص
  //     return;
  //   }
  //   bool isDevelopmentModeEnable = await SafeDevice.isDevelopmentModeEnable;

  //   if (isDevelopmentModeEnable) {
  //     showDialog(
  //       context: context,
  //       builder: (_) => AlertDialog(
  //         title: Text('Security Warning'),
  //         content: Text('This app cannot run on rooted devices'),
  //       ),
  //     );
  //     exit(0);
  //   }
  // }

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
          create: (context) => ProductsCubit(
            getIt.get<HomeRepoImpl>(),
          )..getAllProducts(),
        ),
        // BlocProvider(create: (context) => CounterCubit()),
        // BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => RegisterCubit()),
        //  BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => GoogleSignInCubit()),
        BlocProvider(create: (context) => FacebookSignInCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => ChangeLocationCubit()),

        // BlocProvider<AppBloc>(
        //   create: (context) => AppBloc(theme!),
        // ),

        //  BlocProvider(create: (context) => ChangeLocationCubit()),

        // BlocProvider<ChangeThemeBloc>(
        //     create: (context) => ChangeThemeBloc(theme!)),
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

            // theme: ThemeData.dark().copyWith(
            //   scaffoldBackgroundColor: Colors.white,),
            darkTheme: AppTheme.darkTheme,
            themeMode:
                appBloc!.theme == 'light' ? ThemeMode.light : ThemeMode.dark,
          );
        },
      ),
    );
  }
}
