import 'package:mobx/mobx.dart';
import 'package:xedule_repository/xedule_repository.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = _OnboardingStore with _$OnboardingStore;

enum OnboardingState { logIn, preSelectGroups, selectGroups, reviewGroups }

abstract class _OnboardingStore with Store {
  @observable
  OnboardingState state = OnboardingState.logIn;

  @observable
  ObservableList<Group> filteredGroups = ObservableList<Group>();

  @observable
  ObservableList<Group> selectedGroups = ObservableList<Group>();

  @action
  void setState(OnboardingState state) {
    this.state = state;
  }

  @action
  filterGroups(List<Group> groups, String searchQuery) {
    filteredGroups.clear();

    if (searchQuery == "") {
      filteredGroups.addAll(groups);
    } else {
      filteredGroups.addAll(
        groups.where(
          (g) => g.code.toLowerCase().contains(
                searchQuery.toLowerCase(),
              ),
        ),
      );
    }
  }

  @action
  void toggleSelectGroup(Group group) {
    if (selectedGroups.contains(group)) {
      selectedGroups.remove(group);
    } else {
      selectedGroups.add(group);
    }
  }
}
