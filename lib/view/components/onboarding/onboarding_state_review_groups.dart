import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:provider/provider.dart';

import 'onboarding_button.dart';
import 'onboarding_group_chip_list.dart';
import 'onboarding_header.dart';

class OnboardingStateReviewGroups extends StatelessWidget {
  const OnboardingStateReviewGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onboardingStore = Provider.of<OnboardingStore>(context);

    return Column(
      children: [
        OnboardingHeader(
          image: SvgPicture.asset(
            'assets/onboarding/onboarding_select_groups_done_header.svg',
          ),
          title: 'Selecteer groepen.',
          description:
              'Selecteer de groepen die je wil volgen in je rooster. Je kan er meerdere selecteren.',
        ),
        const OnboardingGroupChipList(),
        const Spacer(),
        Observer(
          builder: (_) => OnboardingButton(
            onPressed: () {
              if (onboardingStore.selectedGroups.isNotEmpty) {
                Navigator.of(context).pushNamed('/');
              } else {
                onboardingStore.setState(OnboardingState.selectGroups);
              }
            },
            child: Text(
              onboardingStore.selectedGroups.isNotEmpty
                  ? 'Ga door naar de app'
                  : 'Open groepenlijst',
            ),
          ),
        ),
      ],
    );
  }
}
