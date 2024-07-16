import 'package:flutter/material.dart';
import 'package:flutter_l_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
            TextFormField(
              decoration: const  InputDecoration(
                labelText: LTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            const SizedBox(
              height: LSizes.spaceBtwSections,
            ),

            /// Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>Get.off(() => const ResetPassword()), child: const Text(LTexts.submit),),)

          ],
        ),
      ),
    );
  }
}
