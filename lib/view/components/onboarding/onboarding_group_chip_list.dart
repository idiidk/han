import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/stores/xedule_store.dart';
import 'package:han/utils/organisational_unit_utils.dart';
import 'package:provider/provider.dart';
import 'package:xedule_repository/xedule_repository.dart';

class OnboardingGroupChipList extends StatelessWidget {
  const OnboardingGroupChipList({Key? key}) : super(key: key);

  Widget buildChip(BuildContext context, Group group) {
    final onboardingStore =
        Provider.of<OnboardingStore>(context, listen: false);
    final xeduleStore = Provider.of<XeduleStore>(context, listen: false);

    final groupOrganisationalUnit = getOrganisationalUnitFromGroup(
      xeduleStore.fetchOrganisationalUnitsFuture!.value!,
      group,
    );
    final chipColor = getOrganisationalUnitColor(groupOrganisationalUnit);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Chip(
        backgroundColor: chipColor,
        deleteIconColor: Colors.black,
        label: Text(
          group.code,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        onDeleted: () {
          onboardingStore.toggleSelectGroup(group);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final onboardingStore = Provider.of<OnboardingStore>(context);
    final selectedGroups = onboardingStore.selectedGroups;

    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Observer(
        builder: (_) {
          if (selectedGroups.isEmpty) {
            return const Center(child: Text('Nog geen groepen geselecteerd'));
          }

          return ListView.builder(
            itemCount: selectedGroups.length,
            itemBuilder: (context, index) => buildChip(
              context,
              selectedGroups[index],
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          );
        },
      ),
    );
  }
}
