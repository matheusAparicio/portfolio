import 'package:mobx/mobx.dart';
part 'preferences_controller.g.dart';

class PreferencesController = _PreferencesControllerBase with _$PreferencesController;

PreferencesController preferences = PreferencesController();

abstract class _PreferencesControllerBase with Store {
  
  @observable
  String language = "English";
  bool darkMode = true;

}