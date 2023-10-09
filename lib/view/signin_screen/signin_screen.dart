import 'package:e_finder/API/api.dart';
import 'package:e_finder/auth/auth.dart';
import 'package:e_finder/constant/constant.dart';
import 'package:e_finder/generated/assets.dart';
import 'package:e_finder/model/userModel.dart';
import 'package:e_finder/view/registration_screen/registration_screen.dart';
import 'package:e_finder/widgets/CustomCheckboxWithForgetPassword.dart';
import 'package:e_finder/widgets/EFinderButton.dart';
import 'package:e_finder/widgets/EFinderDivider.dart';
import 'package:e_finder/widgets/EFinderTextField.dart';
import 'package:e_finder/widgets/socialLogin.dart';
import 'package:e_finder/widgets/EFinderTextButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool flag = true;
  bool _isChecked = false;



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
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
                const Text("Sign In", style: headingStyle),
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 10,
                ),
                CustomCheckboxWithForgetPassword(
                  isForgetPassword: true,
                  onCheckboxTap: () => setState(
                    () => _isChecked = !_isChecked,
                  ),
                  isChecked: _isChecked,
                  onForgetPasswordTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                EFinderButton(onTap: () {}, width: width, label: "Sign In"),
                const SizedBox(
                  height: 10,
                ),
                EFinderDivider(width: width, label: "Login With"),
                const SizedBox(
                  height: 10,
                ),
                SocialLogin(
                    withGoogle: ()=>Auth.signInWithGoogle(),
                    withFacebook: ()=>Auth.signInWithFacebook(),
                    withLinkedin: (user)async{
                      UserModel userModel = await API.registerUser(user!.name!, user!.email!, "Google", user!.sub!);
                      print(userModel.data!.email.toString());
                    }),
                const SizedBox(
                  height: 10,
                ),
                EFinderTextButton(
                    text: "don't have an account?",
                    onTap: ()=>Get.to(const RegistrationScreen()),
                    label: "Register"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
