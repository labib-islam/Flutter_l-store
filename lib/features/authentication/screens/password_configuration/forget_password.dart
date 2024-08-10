import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_l_store/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: const LAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              LTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: LSizes.spaceBtwItems,
            ),
            Text(
              LTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: LSizes.spaceBtwSections * 2,
            ),

            /// Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: LValidator.validateEmail,
                decoration: const  InputDecoration(
                  labelText: LTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(
              height: LSizes.spaceBtwSections,
            ),

            /// Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> controller.sendPasswordResetEmail(), child: const Text(LTexts.submit),),)

          ],
        ),
      ),
    );
  }
}
