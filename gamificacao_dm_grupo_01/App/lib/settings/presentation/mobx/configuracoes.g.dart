// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuracoes.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on _SettingsStore, Store {
  Computed<bool>? _$darkModeStatusComputed;

  @override
  bool get darkModeStatus =>
      (_$darkModeStatusComputed ??= Computed<bool>(() => super.darkModeStatus,
              name: '_SettingsStore.darkModeStatus'))
          .value;

  late final _$_darkModeStatusAtom =
      Atom(name: '_SettingsStore._darkModeStatus', context: context);

  @override
  bool get _darkModeStatus {
    _$_darkModeStatusAtom.reportRead();
    return super._darkModeStatus;
  }

  @override
  set _darkModeStatus(bool value) {
    _$_darkModeStatusAtom.reportWrite(value, super._darkModeStatus, () {
      super._darkModeStatus = value;
    });
  }

  late final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore', context: context);

  @override
  void toggleDarkModeStatus({bool? status}) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.toggleDarkModeStatus');
    try {
      return super.toggleDarkModeStatus(status: status);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
darkModeStatus: ${darkModeStatus}
    ''';
  }
}
