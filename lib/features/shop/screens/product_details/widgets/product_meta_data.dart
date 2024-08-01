import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/images/l_circular_image.dart';
import 'package:flutter_l_store/common/widgets/texts/l_brand_title_text_with_verified_icon.dart';
import 'package:flutter_l_store/common/widgets/texts/product_price_text.dart';
import 'package:flutter_l_store/common/widgets/texts/product_title_text.dart';
import 'package:flutter_l_store/utils/constants/enums.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class LProductMetaData extends StatelessWidget {
  const LProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            LRoundedContainer(
              radius: LSizes.sm,
              backgroundColor: LColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: LSizes.sm, vertical: LSizes.xs),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: LColors.black),
              ),
            ),
            const SizedBox(width: LSizes.spaceBtwItems),

            /// Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: LSizes.spaceBtwItems),
            const LProductPriceText(
              price: '175',
              isLarge: true,
            )
          ],
        ),
        const SizedBox(height: LSizes.spaceBtwItems),

        /// Title
        const LProductTitleText(title: 'Green Nike Sports Shirt'),
        const SizedBox(height: LSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const LProductTitleText(title: 'Status'),
            const SizedBox(width: LSizes.spaceBtwItems),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: LSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            LCircularImage(
              image: LImages.nikeLogo,
              width: 32,
              height: 32,
              overlayColor: dark ? LColors.white : LColors.black,
            ),
            const LBrandTitleTextWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
