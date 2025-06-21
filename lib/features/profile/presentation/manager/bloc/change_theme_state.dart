part of 'change_theme_bloc.dart';

sealed class ChangeThemeState extends Equatable {
  final String? modeTheme;

  const ChangeThemeState(this.modeTheme);

  @override
  List<Object> get props => [];
}

class ChangeThemeInitial extends ChangeThemeState {
  const ChangeThemeInitial({String? modeTheme}) : super(modeTheme ?? 'light');
}

class ChangeSettings extends ChangeThemeState {
  const ChangeSettings(String super.modeTheme);
}
