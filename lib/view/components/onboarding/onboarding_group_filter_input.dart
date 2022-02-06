import 'package:flutter/material.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/stores/xedule_store.dart';
import 'package:provider/provider.dart';

class OnboardingInput extends StatelessWidget {
  const OnboardingInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final xeduleStore = Provider.of<XeduleStore>(context);
    final onboardingStore = Provider.of<OnboardingStore>(context);

    return TextField(
      onChanged: (searchQuery) {
        onboardingStore.filterGroups(xeduleStore.fetchGroupsFuture!.value ?? [], searchQuery);
      },
      decoration: InputDecoration(
        iconColor: Theme.of(context).primaryColor,
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        hintText: 'Groepsnaam',
      ),
    );
  }
}
