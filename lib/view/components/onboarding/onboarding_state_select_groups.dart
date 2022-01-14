import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/view/components/onboarding/onboarding_button.dart';
import 'package:han/view/components/onboarding/onboarding_group_chip_list.dart';
import 'package:han/view/components/onboarding/onboarding_group_list.dart';

import 'onboarding_header.dart';
import 'onboarding_input.dart';

class OnboardingStateSelectGroups extends StatelessWidget {
  const OnboardingStateSelectGroups({
    Key? key,
    required this.onboardingStore,
  }) : super(key: key);

  final OnboardingStore onboardingStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OnboardingHeader(
          image: null,
          title: 'Selecteer groepen.',
          description:
              'Selecteer de groepen die je wil volgen in je rooster. Je kan er meerdere selecteren.',
        ),
        const SizedBox(height: 35),
        const OnboardingInput(),
        const SizedBox(height: 5),
        const OnboardingGroupChipList(),
        const Expanded(
          child: OnboardingGroupList(),
        ),
        const Spacer(),
        OnboardingButton(
          onPressed: () {
            onboardingStore.setState(OnboardingState.reviewGroups);
          },
          child: const Text('Rond af'),
        ),
      ],
    );
  }
}
