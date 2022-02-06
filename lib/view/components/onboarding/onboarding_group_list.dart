import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/stores/xedule_store.dart';
import 'package:han/utils/organisational_unit_utils.dart';
import 'package:provider/provider.dart';
import 'package:xedule_repository/xedule_repository.dart';

class OnboardingGroupList extends StatelessWidget {
  const OnboardingGroupList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final xeduleStore = Provider.of<XeduleStore>(context);
    final onboardingStore = Provider.of<OnboardingStore>(context);

    return Observer(builder: (_) {
      if (!xeduleStore.hasOrganisationalUnits || !xeduleStore.hasGroups) {
        return const Center(child: CircularProgressIndicator());
      }

      List<OrganisationalUnit> organisationalUnits =
          xeduleStore.fetchOrganisationalUnitsFuture!.value ?? [];
      List<Group> groups = onboardingStore.filteredGroups;

      if (groups.isEmpty) {
        return const Text('Geen groepen gevonden');
      }

      return ListView.builder(
        itemCount: groups.length,
        itemBuilder: (_, index) {
          final group = groups[index];
          final groupOrganisationalUnit =
              getOrganisationalUnitFromGroup(organisationalUnits, group);
          final cardColor = getOrganisationalUnitColor(groupOrganisationalUnit);

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 7.5,
            ),
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              splashColor: Colors.white.withOpacity(0.5),
              onTap: () {
                onboardingStore.toggleSelectGroup(group);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          group.code,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          groupOrganisationalUnit?.code ?? '-',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.group,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
