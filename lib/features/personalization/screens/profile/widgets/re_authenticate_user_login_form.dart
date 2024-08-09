import 'package:flutter/material.dart';
import 'package:flutter_l_store/app.dart';
import 'package:flutter_l_store/features/personalization/controllers/user_controller.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: LValidator.validateEmail,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: LTexts.email),
                ),
                const SizedBox(height: LSizes.spaceBtwInputFields),

                /// Password
                Obx(
                      () => TextFormField(
                    controller: controller.verifyPassword,
                    validator: (value) =>
                        LValidator.validateEmptyText('Password', value),
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                        labelText: LTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye),
                        )),
                  ),
                ),
                const SizedBox(height: LSizes.spaceBtwSections),

                /// Verify button
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                        child: const Text('Verify'))),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
