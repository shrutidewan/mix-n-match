import '../services/dart_theme_preferences.dart';
import 'actions.dart';
import 'store.dart';

AppState reducers(AppState prevState, dynamic action) {
  AppState newState;
  if (action is ToggleTheme) {
    DarkThemePreference darkThemePreference = DarkThemePreference();
    darkThemePreference.setDarkTheme(action.darkTheme);
    newState = AppState.copyWith(prev: prevState, darkTheme: action.darkTheme);
  } else if (action is UpdateNewUser) {
    newState = AppState.copyWith(prev: prevState, user: action.newUser);
  } else if (action is UpdateTopImages) {
    newState = AppState.copyWith(prev: prevState, topImages: action.topImages);
  } else if (action is UpdateBottomImages) {
    newState = AppState.copyWith(
      prev: prevState,
      bottomImages: action.bottomImages,
    );
  } else if (action is UpdateShoesImages) {
    newState = AppState.copyWith(
      prev: prevState,
      shoesImages: action.shoesImages,
    );
  } else {
    newState = AppState.copyWith(prev: prevState);
  }
  return newState;
}
