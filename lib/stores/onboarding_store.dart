import 'package:mobx/mobx.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStore with _$OnboardingStore;

enum OnboardingState {
  logIn,
  selectGroups,
  reviewGroups
}

abstract class _OnboardingStore with Store {
  @observable
  OnboardingState state = OnboardingState.logIn;

  @action
  void setState(OnboardingState state) {
    this.state = state;
  }
}