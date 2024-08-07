import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_l_store/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_l_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_l_store/utils/constants/text_strings.dart';
import 'package:flutter_l_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// Send Email Whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Send Email Verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      LLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Please Check your inbox and verify your email.');
    } catch (e) {
      LLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: LImages.successfullyRegisterAnimation,
            title: LTexts.yourAccountCreatedTitle,
            subtitle: LTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
            () => SuccessScreen(
          image: LImages.successfullyRegisterAnimation,
          title: LTexts.yourAccountCreatedTitle,
          subtitle: LTexts.yourAccountCreatedSubTitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
