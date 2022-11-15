// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PreferencesController on _PreferencesControllerBase, Store {
  final _$languageAtom = Atom(name: '_PreferencesControllerBase.language');

  @override
  String get language {
    _$languageAtom.reportRead();
    return super.language;
  }

  @override
  set language(String value) {
    _$languageAtom.reportWrite(value, super.language, () {
      super.language = value;
    });
  }

  final _$darkModeAtom = Atom(name: '_PreferencesControllerBase.darkMode');

  @override
  bool get darkMode {
    _$darkModeAtom.reportRead();
    return super.darkMode;
  }

  @override
  set darkMode(bool value) {
    _$darkModeAtom.reportWrite(value, super.darkMode, () {
      super.darkMode = value;
    });
  }

  final _$_PreferencesControllerBaseActionController =
      ActionController(name: '_PreferencesControllerBase');

  @override
  void switchDarkMode() {
    final _$actionInfo = _$_PreferencesControllerBaseActionController
        .startAction(name: '_PreferencesControllerBase.switchDarkMode');
    try {
      return super.switchDarkMode();
    } finally {
      _$_PreferencesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
language: ${language},
darkMode: ${darkMode}
    ''';
  }
}
