
import 'package:e_finder/generated/assets.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({
    super.key,
    required this.withGoogle,
    required this.withFacebook,
    required this.withLinkedin,
  });

  final void Function()? withGoogle;
  final void Function()? withFacebook;
  final void Function()? withLinkedin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialIcon(iconAsset: Assets.iconGoogle, onTap: withGoogle),
        SocialIcon(iconAsset: Assets.iconFacebook, onTap: withFacebook),
        SocialIcon(iconAsset: Assets.iconLinkedin, onTap: withLinkedin),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String iconAsset;
  final void Function()? onTap;

  const SocialIcon({
    required this.iconAsset,
    required this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        iconAsset,
        width: 30, // Customize icon size as needed
        height:30,
      ),
    );
  }
}