import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/styles/shadows.dart';
import 'package:flutter_l_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_l_store/common/widgets/images/l_rounded_image.dart';
import 'package:flutter_l_store/common/widgets/texts/l_brand_title_text_with_verified_icon.dart';
import 'package:flutter_l_store/features/shop/screens/product_details/product_detail.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../icons/l_circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class LProductCardVertical extends StatelessWidget {
  const LProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [LShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(LSizes.productImageRadius),
          color: dark ? LColors.darkerGrey : LColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            LRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(LSizes.sm),
              backgroundColor: dark ? LColors.dark : LColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  const LRoundedImage(
                    imageUrl: LImages.productImage1,
                    applyImageRadius: true,
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
            const SizedBox(
              height: LSizes.spaceBtwItems / 2,
            ),

            /// -- Details
            const Padding(
              padding: EdgeInsets.only(left: LSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LProductTitleText(
                    title: 'Green Nike Air Shoes',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: LSizes.spaceBtwItems / 2,
                  ),
                  LBrandTitleTextWithVerifiedIcon(title: 'Nike')
                ],
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// -- Price
                const Padding(
                  padding: EdgeInsets.only(left: LSizes.sm),
                  child: LProductPriceText(
                    price: '35.0',
                  ),
                ),

                /// Add to Cart Button
                Container(
                  decoration: const BoxDecoration(
                      color: LColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(LSizes.cardRadiusMd),
                        bottomRight: Radius.circular(LSizes.productImageRadius),
                      )),
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
    );
  }
}

// class LBrandTitleText extends StatelessWidget {
//   const LBrandTitleText({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           'Nike',
//           overflow: TextOverflow.ellipsis,
//           maxLines: 1,
//           style: Theme.of(context).textTheme.labelMedium,
//         ),
//         const SizedBox(
//           width: LSizes.xs,
//         ),
//         const Icon(
//           Iconsax.verify5,
//           color: LColors.primary,
//           size: LSizes.iconXs,
//         ),
//       ],
//     );
//   }
// }
