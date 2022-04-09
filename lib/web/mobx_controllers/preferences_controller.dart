import 'package:mobx/mobx.dart';
part 'preferences_controller.g.dart';

class PreferencesController = _PreferencesControllerBase with _$PreferencesController;

PreferencesController preferencesController = PreferencesController();

abstract class _PreferencesControllerBase with Store {
  
  @observable
  String language = "English";

  @observable
  bool darkMode = true;

  @action
  void switchDarkMode() {
    darkMode = !darkMode;
  }

}