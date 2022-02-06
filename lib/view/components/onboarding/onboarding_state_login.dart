import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:han/stores/onboarding_store.dart';
import 'package:han/stores/xedule_store.dart';
import 'package:han/view/components/onboarding/onboarding_header.dart';
import 'package:provider/provider.dart';
import 'onboarding_button.dart';

class OnboardingStateLogin extends StatefulWidget {
  const OnboardingStateLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingStateLogin> createState() => _OnboardingStateLoginState();
}

class _OnboardingStateLoginState extends State<OnboardingStateLogin> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final xeduleStore = Provider.of<XeduleStore>(context);
    final onboardingStore = Provider.of<OnboardingStore>(context);

    return Column(
      children: [
        OnboardingHeader(
          image: SvgPicture.asset(
            'assets/onboarding/onboarding_login_header.svg',
          ),
          title: 'Welkom bij de onofficiële HAN app.',
          description:
              'Log in om door te gaan. Je rooster, lokaalbeschikbaarheid en storingen op de HAN allemaal op één plek!',
        ),
        const Spacer(),
        IgnorePointer(
          ignoring: _loading,
          child: OnboardingButton(
            onPressed: () async {
              setState(() {
                _loading = true;
              });

              bool success = await xeduleStore.repository.signIn();

              setState(() {
                _loading = false;
              });

              if (success) {
                onboardingStore.setState(
                  OnboardingState.preSelectGroups,
                );
              }
            },
            child: _loading
                ? Transform.scale(
                    scale: 0.5,
                    child: const CircularProgressIndicator(color: Colors.black),
                  )
                : const Text('Log in'),
          ),
        )
      ],
    );
  }
}
