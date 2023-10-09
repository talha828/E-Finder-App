import 'package:e_finder/generated/assets.dart';
import 'package:easy_linkedin_login/easy_linkedin_login.dart';
import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
   SocialLogin({
    super.key,
    required this.withGoogle,
    required this.withFacebook,
    required this.withLinkedin,
  });


   final config = LinkedInConfig(
     clientId: '771spoccusd30i',
     clientSecret: 'd8ELuvYCWsqmVzzF',
     redirectUrl: 'https://api.linkedin.com/v2/me',
   );

   UserObject? user;
   bool logoutUser = false;
  final void Function()? withGoogle;
  final void Function()? withFacebook;
  void Function(LinkedInUserModel)? withLinkedin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SocialIcon(iconAsset: Assets.iconGoogle, onTap: withGoogle),
        SocialIcon(iconAsset: Assets.iconFacebook, onTap: withFacebook),
        LinkedInCustomButton(
          config: config,
          destroySession: false,
          onError: (error) => print('Error: ${error.message}'),
          onGetAuthToken: (data) => print('Access token ${data.accessToken!}'),
          onGetUserProfile: withLinkedin,
          child: Image.asset(
            Assets.iconLinkedin,
            width: 30, // Customize icon size as needed
            height:30,
          ),
        ),
         // SocialIcon(iconAsset: Assets.iconLinkedin, onTap: withLinkedin),
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
class AuthCodeObject {
  AuthCodeObject({required this.code, required this.state});

  final String? code;
  final String? state;
}

class UserObject {
  UserObject({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImageUrl,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? profileImageUrl;
}
