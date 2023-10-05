import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
  Auth._();

    static Future<bool> signInWithGoogle() async {

      GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email',],);

      GoogleSignInAccount? data;

      try {

         data =  await googleSignIn.signIn();

      } catch (error) {

        Get.snackbar(
          "Google SignIn Failed",
          "Due to some reason Your Google SingIn Failed",
          snackPosition: SnackPosition.BOTTOM,
        );

      }
      return data != null ? true : false ;
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

        print(data!.additionalUserInfo!.profile);
        print(data!.additionalUserInfo!.username);
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

    static Future<bool> signInWithLinkedin() async {

      var data;

      try{

      }catch (e){

      }
      return data != null ? true :false;
    }


}