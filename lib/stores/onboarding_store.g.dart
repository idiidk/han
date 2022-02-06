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

  final _$filteredGroupsAtom = Atom(name: '_OnboardingStore.filteredGroups');

  @override
  ObservableList<Group> get filteredGroups {
    _$filteredGroupsAtom.reportRead();
    return super.filteredGroups;
  }

  @override
  set filteredGroups(ObservableList<Group> value) {
    _$filteredGroupsAtom.reportWrite(value, super.filteredGroups, () {
      super.filteredGroups = value;
    });
  }

  final _$selectedGroupsAtom = Atom(name: '_OnboardingStore.selectedGroups');

  @override
  ObservableList<Group> get selectedGroups {
    _$selectedGroupsAtom.reportRead();
    return super.selectedGroups;
  }

  @override
  set selectedGroups(ObservableList<Group> value) {
    _$selectedGroupsAtom.reportWrite(value, super.selectedGroups, () {
      super.selectedGroups = value;
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
  dynamic filterGroups(List<Group> groups, String searchQuery) {
    final _$actionInfo = _$_OnboardingStoreActionController.startAction(
        name: '_OnboardingStore.filterGroups');
    try {
      return super.filterGroups(groups, searchQuery);
    } finally {
      _$_OnboardingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSelectGroup(Group group) {
    final _$actionInfo = _$_OnboardingStoreActionController.startAction(
        name: '_OnboardingStore.toggleSelectGroup');
    try {
      return super.toggleSelectGroup(group);
    } finally {
      _$_OnboardingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
filteredGroups: ${filteredGroups},
selectedGroups: ${selectedGroups}
    ''';
  }
}
