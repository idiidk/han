import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/view/components/onboarding/onboarding_state_login.dart';
import 'package:han/view/components/onboarding/onboarding_state_pre_select_groups.dart';
import 'package:han/view/components/onboarding/onboarding_state_select_groups.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late OnboardingStore onboardingStore;
  late Map<OnboardingState, Widget> onboardingStates;

  @override
  void initState() {
    super.initState();

    onboardingStore = OnboardingStore();
    onboardingStates = {
      OnboardingState.logIn: OnboardingStateLogin(
        onboardingStore: onboardingStore,
      ),
      OnboardingState.preSelectGroups: OnboardingStatePreSelectGroups(
        onboardingStore: onboardingStore,
      ),
      OnboardingState.selectGroups: OnboardingStateSelectGroups(
        onboardingStore: onboardingStore,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Observer(
            builder: (_) => AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: onboardingStates[onboardingStore.state] ??
                  const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
