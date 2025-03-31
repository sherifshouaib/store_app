import 'package:bloc/bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    print(transition);
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   // TODO: implement onChange
  //   super.onChange(bloc, change);
  //   print(change);
  // }
}
