import 'package:e_finder/API/api.dart';
import 'package:e_finder/model/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Auth{
  Auth._();

    static Future<bool?> signInWithGoogle() async {
      try {
        final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );

          final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
          final User? user = authResult.user;
          print("==== Google Login SuccessFul ====");
          UserModel userModel = await API.registerUser(user!.displayName!, user!.email!, "Google", user!.uid);
          print(userModel.data!.email.toString());
          return user != null ?true:false;
        }
      } catch (error) {
        Get.snackbar(
          "Google SignIn Failed",
          "Due to some reason Your Google SingIn Failed",
          snackPosition: SnackPosition.BOTTOM,
        );
        print("Google Sign-In Error: $error");
        return false;
      }
    }

    static Future<bool> signInWithFacebook() async {
    UserCredential? data;

    try{
      final LoginResult result = await FacebookAuth.instance.login();
      if(result.status == LoginStatus.success){
        // Create a credential from the access token
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.token);
        // Once signed in, return the UserCredential
        data = await FirebaseAuth.instance.signInWithCredential(credential);

        Get.snackbar(
          "Facebook SignIn Successful",
          "Hey Your Good by",
          snackPosition: SnackPosition.BOTTOM,
        );
        // print(data!.additionalUserInfo!.profile);
        // print(data!.additionalUserInfo!.username);
      }
    }catch (e){

      Get.snackbar(
        "Facebook SignIn Failed",
        "Due to some reason Your Facebook SingIn Failed",
        snackPosition: SnackPosition.BOTTOM,
      );

      print(e);

    }

    return data != null ? true :false;

  }

}