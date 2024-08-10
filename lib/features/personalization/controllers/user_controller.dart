import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_l_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_l_store/data/repositories/user/user_repository.dart';
import 'package:flutter_l_store/features/authentication/screens/login/login.dart';
import 'package:flutter_l_store/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/popups/full_screen_loader.dart';
import 'package:flutter_l_store/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/helpers/network_manager.dart';
import '../../authentication/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch User record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First Update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      // if no record already stored
      if(user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts =
          UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username =
          UserModel.generateUsername(userCredentials.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }

    } catch (e) {
      LLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(LSizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: LSizes.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
          onPressed: () => Navigator.of(Get.overlayContext!).pop(),
          child: const Text('Cancel'),
        ));
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      LFullScreenLoader.openLoadingDialog('Processing', LImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          LFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          LFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      LFullScreenLoader.stopLoading();
      LLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      LFullScreenLoader.openLoadingDialog(
          'Processing...', LImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        LFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        LFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      // Remove Loader
      LFullScreenLoader.stopLoading();

      // Redirect
      Get.offAll(() => const LoginScreen());

    } catch (e) {
      // Remove Loader
      LFullScreenLoader.stopLoading();
      // Show some Generic Error to the user
      LLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70, maxHeight: 512, maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update User Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        LLoaders.successSnackBar(title: 'Congratulations', message: 'Your Profile Image has been updated');
      }
    } catch (e) {
      LLoaders.errorSnackBar(title: 'Oh Snap!', message: 'Something went wrong: $e');
    } finally {
      imageUploading.value = false;
    }

  }
}
