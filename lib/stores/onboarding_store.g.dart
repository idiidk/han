// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnboardingStore on _OnboardingStore, Store {
  final _$stateAtom = Atom(name: '_OnboardingStore.state');

  @override
  OnboardingState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(OnboardingState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_OnboardingStoreActionController =
      ActionController(name: '_OnboardingStore');

  @override
  void setState(OnboardingState state) {
    final _$actionInfo = _$_OnboardingStoreActionController.startAction(
        name: '_OnboardingStore.setState');
    try {
      return super.setState(state);
    } finally {
      _$_OnboardingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
