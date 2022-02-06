import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/view/components/onboarding/onboarding_state_login.dart';
import 'package:han/view/components/onboarding/onboarding_state_pre_select_groups.dart';
import 'package:han/view/components/onboarding/onboarding_state_review_groups.dart';
import 'package:han/view/components/onboarding/onboarding_state_select_groups.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late Map<OnboardingState, Widget> onboardingStates;

  @override
  void initState() {
    super.initState();

    onboardingStates = {
      OnboardingState.logIn: const OnboardingStateLogin(),
      OnboardingState.preSelectGroups: const OnboardingStatePreSelectGroups(),
      OnboardingState.selectGroups: const OnboardingStateSelectGroups(),
      OnboardingState.reviewGroups: const OnboardingStateReviewGroups(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final onboardingStore = Provider.of<OnboardingStore>(context);

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
      resizeToAvoidBottomInset: false,
    );
  }
}
