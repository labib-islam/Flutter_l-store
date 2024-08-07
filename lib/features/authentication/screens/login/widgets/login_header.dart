import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';


class LLoginHeader extends StatelessWidget {
  const LLoginHeader({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: LSizes.spaceBtwSections),
          child: Image(
            image: AssetImage(
                dark ? LImages.lightAppLogo : LImages.darkAppLogoL),
            height: 100,
          ),
        ),
        Text(LTexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: LSizes.sm,
        ),
        Text(LTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
