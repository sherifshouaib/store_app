part of 'change_theme_bloc.dart';

sealed class ChangeThemeEvent extends Equatable {
  const ChangeThemeEvent();

  @override
  List<Object> get props => [];
}

class InitEvent extends ChangeThemeEvent {}

class ThemeEvent extends ChangeThemeEvent {
  final String theme;
  const ThemeEvent({required this.theme});
}
