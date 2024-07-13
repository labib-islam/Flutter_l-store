import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/styles/spacing_styles.dart';
import 'package:flutter_l_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter_l_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: LSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Subtitle
              const LLoginHeader(),

              /// Form
              const LLoginForm(),

              /// Divider
              LFormDivider(dividerText: LTexts.orSignInWith.capitalize!,),
              const SizedBox(height: LSizes.spaceBtwSections,),

              /// Footer
              const LSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}




