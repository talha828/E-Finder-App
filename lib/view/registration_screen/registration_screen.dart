import 'package:e_finder/API/api.dart';
import 'package:e_finder/auth/auth.dart';
import 'package:e_finder/constant/constant.dart';
import 'package:e_finder/generated/assets.dart';
import 'package:e_finder/widgets/CustomCheckboxWithForgetPassword.dart';
import 'package:e_finder/widgets/EFinderButton.dart';
import 'package:e_finder/widgets/EFinderDivider.dart';
import 'package:e_finder/widgets/EFinderTextField.dart';
import 'package:e_finder/widgets/socialLogin.dart';
import 'package:e_finder/widgets/EFinderTextButton.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  bool flag = true;
  bool _isChecked = false;
  String label = "Sign In";
  String text = "Sign In";
  void Function()? onTap = () {};

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height * 1.04,
            // width:width,
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  Assets.assetsLogo,
                  width: width * 0.3,
                  height: width * 0.3,
                ),
                const Text("Registration", style: headingStyle),
                const SizedBox(
                  height: 20,
                ),
                EFinderTextField(
                  controller: name,
                  label: "Name",
                  hintText: "John Wick",
                ),
                EFinderTextField(
                  controller: email,
                  label: "Email",
                  hintText: "example@gmail.com",
                ),
                EFinderTextField(
                    controller: password,
                    label: "Password",
                    hintText: "*****",
                    obscureText: true,
                    suffixIcon: Icons.remove_red_eye_outlined),
                EFinderTextField(
                    controller: confirm,
                    label: "Confirm Password",
                    hintText: "*****",
                    obscureText: true,
                    suffixIcon: Icons.remove_red_eye_outlined),
                const SizedBox(
                  height: 10,
                ),
                CustomCheckboxWithForgetPassword(
                  isForgetPassword: false,
                  onCheckboxTap: () => setState(
                        () => _isChecked = !_isChecked,
                  ),
                  isChecked: _isChecked,
                  onForgetPasswordTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                EFinderButton(onTap: (){}, width: width, label: "Register"),
                const SizedBox(
                  height: 20,
                ),
                EFinderDivider(width: width, label: "Register With"),
                const SizedBox(
                  height: 20,
                ),
                SocialLogin(
                    withGoogle: ()=>Auth.signInWithGoogle(),
                    withFacebook: ()=>Auth.signInWithFacebook(),
                    withLinkedin:(user)async=>await API.registerUser(user!.familyName!, user!.email!, "Google", user!.sub!)),
                const SizedBox(
                  height: 20,
                ),
                EFinderTextButton(
                    text: "Already have an account?",
                    onTap: onTap,
                    label: "Sign In"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
