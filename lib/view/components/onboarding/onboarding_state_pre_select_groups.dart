import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/view/components/onboarding/onboarding_button.dart';

import 'onboarding_header.dart';

class OnboardingStatePreSelectGroups extends StatelessWidget {
  const OnboardingStatePreSelectGroups({
    Key? key,
    required this.onboardingStore,
  }) : super(key: key);

  final OnboardingStore onboardingStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnboardingHeader(
          image: SvgPicture.asset(
            'assets/onboarding/onboarding_select_groups_header.svg',
          ),
          title: 'Selecteer groepen.',
          description:
              'Selecteer de groepen die je wil volgen in je rooster. Je kan er meerdere selecteren.',
        ),
        const Spacer(),
        OnboardingButton(
          onPressed: () {
            onboardingStore.setState(OnboardingState.selectGroups);
          },
          child: const Text('Open groepenlijst'),
        ),
      ],
    );
  }
}
