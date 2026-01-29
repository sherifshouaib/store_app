import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_themes.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/auth/presentation/manager/blocs/auth_bloc/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/manager/cubits/facebook_sign_in_cubit/facebook_sign_in_cubit.dart';
import 'package:store_app/features/auth/presentation/manager/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:store_app/features/order_location/presentation/manager/cubit/change_location_cubit.dart';

import 'features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'firebase_options.dart';

//String? theme;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // theme = prefs.getString('theme') ?? 'light';
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

// Enable performance collection
  await FirebasePerformance.instance.setPerformanceCollectionEnabled(true);

  setupServiceLocator();
  //  Stripe.publishableKey = ApiKeys.publishableKey;
  // Bloc.observer = SimpleBlocObserver();
  //  await LocalNotificationService.init();

  runApp(const StoreApp());
}

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
//ChangeThemeBloc? changeThemeBloc;

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

        //  BlocProvider(create: (context) => ChangeLocationCubit()),

        // BlocProvider<ChangeThemeBloc>(
        //     create: (context) => ChangeThemeBloc(theme!)),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,

        // theme: ThemeData.dark().copyWith(
        //   scaffoldBackgroundColor: Colors.white,),
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
      ),
    );
  }
}
