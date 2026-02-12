abstract class AppEvent {
  const AppEvent();
}

class InitEvent extends AppEvent {}

class ThemeEvent extends AppEvent {
  final String theme;

  const ThemeEvent({required this.theme});
}
