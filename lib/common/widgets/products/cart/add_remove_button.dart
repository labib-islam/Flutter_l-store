import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/l_circular_icon.dart';

class LProductQuantityWithAddRemove extends StatelessWidget {
  const LProductQuantityWithAddRemove({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: LSizes.md,
          color: dark ? LColors.white : LColors.black,
          backgroundColor:
          dark ? LColors.darkerGrey : LColors.light,
        ),
        const SizedBox(width: LSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: LSizes.spaceBtwItems),
        const LCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: LSizes.md,
          color: LColors.white,
          backgroundColor: LColors.primary,
        ),
      ],
    );
  }
}
