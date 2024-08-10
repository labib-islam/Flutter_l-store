import 'package:flutter/cupertino.dart';
import 'package:flutter_l_store/data/repositories/user/user_repository.dart';
import 'package:flutter_l_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter_l_store/features/personalization/screens/profile/profile.dart';
import 'package:flutter_l_store/utils/popups/loaders.dart';
import 'package:get/get.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch User Records
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }


  Future<void> updateUserName() async {
    try {
      // Start Loading
      LFullScreenLoader.openLoadingDialog(
          'We are updating your information...', LImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        LFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        // Remove Loader
        LFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      LFullScreenLoader.stopLoading();

      // Show Success Message
      LLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated');

      // Move to previous screen
      Get.off(() => const ProfileScreen());

    } catch (e) {
      // Remove Loader
      LFullScreenLoader.stopLoading();
      LLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }



}