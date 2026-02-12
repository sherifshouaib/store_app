abstract class AppState {
  final String? modeTheme;

  const AppState({this.modeTheme});
}

class AppInitial extends AppState {
  const AppInitial({String? modeTheme})
      : super(modeTheme: modeTheme ?? 'light');
}

class ChangeSettings extends AppState {
  const ChangeSettings(String modeTheme) : super(modeTheme: modeTheme);
}
