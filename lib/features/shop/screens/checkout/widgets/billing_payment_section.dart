import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_l_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class LBillingPaymentSection extends StatelessWidget {
  const LBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        LSectionHeading(
            title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        const SizedBox(height: LSizes.spaceBtwItems / 2),
        Row(
          children: [
            LRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? LColors.light : LColors.white,
              padding: const EdgeInsets.all(LSizes.sm),
              child: const Image(image: AssetImage(LImages.paypal), fit: BoxFit.contain,),
            ),
            const SizedBox(width: LSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
