import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
  Auth._();


    static Future<bool> googleHandleSignIn() async {

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


}