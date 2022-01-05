import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingHeader extends StatelessWidget {
  const OnboardingHeader({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final SvgPicture image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        image,
        const SizedBox(
          height: 25,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12.5,
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF7E7D82),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
