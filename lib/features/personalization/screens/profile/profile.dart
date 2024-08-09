import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/common/widgets/images/l_circular_image.dart';
import 'package:flutter_l_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_l_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter_l_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:flutter_l_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const LAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const LCircularImage(image: LImages.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text("Change Profile Picture"))
                  ],
                ),
              ),

              /// Details
              const SizedBox(height: LSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),

              /// Heading Profile Info
              const LSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: LSizes.spaceBtwItems),

              LProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              LProfileMenu(onPressed: (){}, title: 'Username', value: controller.user.value.username),

              const SizedBox(height: LSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),

              /// Heading Personal Info
              const LSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: LSizes.spaceBtwItems),

              LProfileMenu(onPressed: (){}, title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy,),
              LProfileMenu(onPressed: (){}, title: 'E-mail', value: controller.user.value.email),
              LProfileMenu(onPressed: (){}, title: 'Phone Number', value: controller.user.value.phoneNumber),
              LProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
              LProfileMenu(onPressed: (){}, title: 'Date of Birth', value: '10 Oct, 1994'),
              const Divider(),
              const SizedBox(height: LSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
