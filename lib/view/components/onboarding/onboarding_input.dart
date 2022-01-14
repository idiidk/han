import 'package:flutter/material.dart';

class OnboardingInput extends StatelessWidget {
  const OnboardingInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
