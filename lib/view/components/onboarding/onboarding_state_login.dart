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
    required this.onboardingStore,
  }) : super(key: key);

  final OnboardingStore onboardingStore;

  @override
  State<OnboardingStateLogin> createState() => _OnboardingStateLoginState();
}

class _OnboardingStateLoginState extends State<OnboardingStateLogin> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final xeduleStore = Provider.of<XeduleStore>(context);

    return Column(
      children: [
        OnboardingHeader(
          image: SvgPicture.asset(
            'assets/onboarding/login_onboarding_header.svg',
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
                _loading = !_loading;
              });

              await xeduleStore.repository.signIn();

              setState(() {
                _loading = false;
              });

              widget.onboardingStore.setState(OnboardingState.selectGroups);
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
