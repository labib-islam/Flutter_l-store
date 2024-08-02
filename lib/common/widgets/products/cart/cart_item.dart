import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../images/l_rounded_image.dart';
import '../../texts/l_brand_title_text_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class LCartItem extends StatelessWidget {
  const LCartItem({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        /// Image
        LRoundedImage(
          imageUrl: LImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(LSizes.sm),
          backgroundColor:
          dark ? LColors.darkerGrey : LColors.light,
        ),
        const SizedBox(width: LSizes.spaceBtwItems),

        /// Title, Price & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LBrandTitleTextWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: LProductTitleText(title: 'Black Sports Shoes', maxLines: 1)),
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                        TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(text: 'EU 38 ', style: Theme.of(context).textTheme.bodyLarge),
                      ]
                  )
              )
            ],
          ),
        )

      ],
    );
  }
}
