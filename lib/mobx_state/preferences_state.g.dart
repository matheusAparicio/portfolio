// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PreferencesState on _PreferencesStateBase, Store {
  final _$languageAtom = Atom(name: '_PreferencesStateBase.language');

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

  final _$darkModeAtom = Atom(name: '_PreferencesStateBase.darkMode');

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

  final _$showContactsAtom = Atom(name: '_PreferencesStateBase.showContacts');

  @override
  bool get showContacts {
    _$showContactsAtom.reportRead();
    return super.showContacts;
  }

  @override
  set showContacts(bool value) {
    _$showContactsAtom.reportWrite(value, super.showContacts, () {
      super.showContacts = value;
    });
  }

  final _$_PreferencesStateBaseActionController =
      ActionController(name: '_PreferencesStateBase');

  @override
  void switchDarkMode() {
    final _$actionInfo = _$_PreferencesStateBaseActionController.startAction(
        name: '_PreferencesStateBase.switchDarkMode');
    try {
      return super.switchDarkMode();
    } finally {
      _$_PreferencesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchLanguage() {
    final _$actionInfo = _$_PreferencesStateBaseActionController.startAction(
        name: '_PreferencesStateBase.switchLanguage');
    try {
      return super.switchLanguage();
    } finally {
      _$_PreferencesStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
language: ${language},
darkMode: ${darkMode},
showContacts: ${showContacts}
    ''';
  }
}
