import 'package:flutter/material.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/stores/xedule_store.dart';
import 'package:han/view/components/onboarding/onboarding_button.dart';
import 'package:han/view/components/onboarding/onboarding_group_chip_list.dart';
import 'package:han/view/components/onboarding/onboarding_group_list.dart';
import 'package:provider/provider.dart';

import 'onboarding_header.dart';
import 'onboarding_group_filter_input.dart';

class OnboardingStateSelectGroups extends StatefulWidget {
  const OnboardingStateSelectGroups({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingStateSelectGroups> createState() =>
      _OnboardingStateSelectGroupsState();
}

class _OnboardingStateSelectGroupsState
    extends State<OnboardingStateSelectGroups> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final xeduleStore = Provider.of<XeduleStore>(context, listen: false);
      final onboardingStore = Provider.of<OnboardingStore>(context, listen: false);

      xeduleStore.fetchGroups();
      xeduleStore.fetchOrganisationalUnits();

      xeduleStore.fetchGroupsFuture!.then((groups) {
        onboardingStore.filterGroups(groups, "");
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final onboardingStore = Provider.of<OnboardingStore>(context);

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
        const SizedBox(height: 5),
        OnboardingButton(
          onPressed: () {
            if (onboardingStore.selectedGroups.isEmpty) {
              const snackBar = SnackBar(
                content: Text('Selecteer minstens één groep, je kan dit altijd later nog aanpassen.'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              return;
            }

            onboardingStore.setState(OnboardingState.reviewGroups);
          },
          child: const Text('Rond af'),
        ),
      ],
    );
  }
}
