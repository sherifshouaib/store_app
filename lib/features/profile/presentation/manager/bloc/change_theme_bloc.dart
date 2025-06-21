import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/core/storage_helper/storage_helper.dart';

part 'change_theme_event.dart';
part 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState>
    with StorageHelper {
  String theme;
  ChangeThemeBloc(this.theme) : super(ChangeThemeInitial()) {
    on<InitEvent>(_init);
    on<ThemeEvent>(_changeTheme);
  }

  void _init(InitEvent event, Emitter<ChangeThemeState> emit) async {
    theme = await getTheme() ?? 'light';
    emit(ChangeThemeInitial(modeTheme: theme));
  }

  void _changeTheme(ThemeEvent event, Emitter<ChangeThemeState> emit) async {
    theme = event.theme;
    await saveTheme(theme);
    emit(ChangeSettings(theme));
  }
}
