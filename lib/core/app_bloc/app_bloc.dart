import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/app_bloc/app_event.dart';
import 'package:store_app/core/storage_helper/storage_helper.dart';

import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> with StorageHelper {
  String theme;

  AppBloc(this.theme) : super(AppInitial()) {
    on<InitEvent>(_init);
    on<ThemeEvent>(_changeTheme);
  }

  void _init(InitEvent event, Emitter<AppState> emit) async {
    theme = await getTheme() ?? 'light';
    emit(AppInitial(modeTheme: theme));
  }

  void _changeTheme(ThemeEvent event, Emitter<AppState> emit) async {
    theme = event.theme;
    await saveTheme(theme);
    emit(ChangeSettings(theme));
  }
}
