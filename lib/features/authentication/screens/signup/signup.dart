import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/login_signup/form_divider.dart';
import 'package:flutter_l_store/common/widgets/login_signup/social_buttons.dart';
import 'package:flutter_l_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:get/get.dart';


import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                LTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: LSizes.spaceBtwSections,
              ),

              /// Form
              const LSignupForm(),
              const SizedBox(
                height: LSizes.spaceBtwSections,
              ),

              /// Divider
              LFormDivider(dividerText: LTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: LSizes.spaceBtwSections,
              ),

              /// Social Buttons
              const LSocialButtons(),

            
            ],
          ),
        ),
      ),
    );
  }
}


