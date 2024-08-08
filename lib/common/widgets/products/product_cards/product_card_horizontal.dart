import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_l_store/common/widgets/images/l_rounded_image.dart';
import 'package:flutter_l_store/common/widgets/texts/l_brand_title_text_with_verified_icon.dart';
import 'package:flutter_l_store/common/widgets/texts/product_price_text.dart';
import 'package:flutter_l_store/common/widgets/texts/product_title_text.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/l_circular_icon.dart';

class LProductCardHorizontal extends StatelessWidget {
  const LProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(LSizes.productImageRadius),
        color: dark ? LColors.darkerGrey : LColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          LRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(LSizes.sm),
            backgroundColor: dark ? LColors.dark : LColors.white,
            child: Stack(
              children: [
                /// -- Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: LRoundedImage(
                    imageUrl: LImages.productImage1,
                    applyImageRadius: true,
                  ),
                ),

                /// -- Sale Tag
                Positioned(
                  top: 12,
                  child: LRoundedContainer(
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
                ),

                /// -- Favorite Icon Button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: LCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),

          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: LSizes.sm, left: LSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LProductTitleText(
                        title: 'Green Nike Half Sleeves Shirt',
                        smallSize: true,
                      ),
                      SizedBox(height: LSizes.spaceBtwItems / 2),
                      LBrandTitleTextWithVerifiedIcon(title: 'Nike')
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(child: LProductPriceText(price: '256.0')),

                      /// Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: LColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(LSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(LSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: LSizes.iconLg * 1.2,
                          height: LSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: LColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
