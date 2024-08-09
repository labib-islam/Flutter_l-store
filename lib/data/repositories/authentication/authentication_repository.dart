import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_l_store/data/repositories/user/user_repository.dart';
import 'package:flutter_l_store/features/authentication/screens/login/login.dart';
import 'package:flutter_l_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_l_store/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_l_store/navigation_menu.dart';
import 'package:flutter_l_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:flutter_l_store/utils/exceptions/format_exceptions.dart';
import 'package:flutter_l_store/utils/exceptions/platform_exceptions.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authenticated User Data
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (kDebugMode) {
      print('================= GET STORAGE AUTH REPO =================');
      print(deviceStorage.read('IsFirstTime'));
      print(user);
    }

    if(user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }

  }

/* -------------------- Email & Password sign-in -------------------- */

  /// [EmailAuthentication] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// [EmailVerification] - MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      //
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }


/* -------------------- Federated identity & social sign-in -------------------- */

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  /// [FacebookAuthentication] - FACEBOOK

/* -------------------- ./end Federated identity & social sign-in -------------------- */

  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      try {
        await GoogleSignIn().disconnect();
      } catch (e) {
        if (kDebugMode) print('Something went wrong: $e');
      }

      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [DeleteUser] - Remove User Auth & Firebase Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw LFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw LFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const LFormatException();
    } on PlatformException catch (e) {
      throw LPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
