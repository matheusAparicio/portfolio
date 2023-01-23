import 'package:mobx/mobx.dart';
part 'preferences_state.g.dart';

class PreferencesState = _PreferencesStateBase with _$PreferencesState;

PreferencesState preferencesState = PreferencesState();

abstract class _PreferencesStateBase with Store {
  
  @observable
  String language = "english";

  @observable
  bool darkMode = true;

  @observable
  bool showContacts = false;

  @action
  void switchDarkMode() {
    darkMode = !darkMode;
  }

  @action
  void switchLanguage() {
    if (language == "english") {
      language = "portuguese";
    } else {
      language = "english";
    }
  }

}