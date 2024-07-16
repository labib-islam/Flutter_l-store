import 'package:flutter/material.dart';
import 'package:flutter_l_store/features/authentication/screens/signup/verify_email.dart';
import 'package:flutter_l_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../signup.dart';


class LSignupForm extends StatelessWidget {
  const LSignupForm({
    super.key,

  });



  @override
  Widget build(BuildContext context) {


    return Form(
      child: Column(
        children: [

          /// First Name, Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: LTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(
                width: LSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: LTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: LSizes.spaceBtwInputFields,
          ),

          /// Username
          TextFormField(
            decoration: const InputDecoration(
              labelText: LTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: LSizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            decoration: const InputDecoration(
              labelText: LTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: LSizes.spaceBtwInputFields,
          ),

          /// Phone Number
          TextFormField(
            decoration: const InputDecoration(
              labelText: LTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: LSizes.spaceBtwInputFields,
          ),

          /// Password
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: LTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: LSizes.spaceBtwSections,
          ),

          /// Terms&Conditions Checkbox
          const LTermsAndConditionCheckbox(),
          const SizedBox(
            height: LSizes.spaceBtwSections,
          ),

          /// Sign Up Button
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEmailScreen()), child: const Text(LTexts.createAccount),),),

        ],
      ),
    );
  }
}

