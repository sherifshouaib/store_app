import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:store_app/core/utils/api_keys.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/service_locator.dart';
import 'package:store_app/features/auth/presentation/manager/blocs/auth_bloc/auth_bloc.dart';
import 'package:store_app/features/auth/presentation/manager/cubits/google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/presentation/manager/counter_cubit/counter_cubit.dart';
import 'package:store_app/features/home/presentation/manager/products_cubit/products_cubit.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  //Stripe.publishableKey = ApiKeys.publishableKey;
  // Bloc.observer = SimpleBlocObserver();

  runApp(const StoreApp());



}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

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
        BlocProvider(create: (context) => CounterCubit()),
        // BlocProvider(create: (context) => LoginCubit()),
        // BlocProvider(create: (context) => RegisterCubit()),
        //  BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => GoogleSignInCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
