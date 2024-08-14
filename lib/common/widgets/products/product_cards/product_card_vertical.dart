import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/styles/shadows.dart';
import 'package:flutter_l_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_l_store/common/widgets/images/l_rounded_image.dart';
import 'package:flutter_l_store/common/widgets/texts/l_brand_title_text_with_verified_icon.dart';
import 'package:flutter_l_store/features/shop/controllers/product_controller.dart';
import 'package:flutter_l_store/features/shop/models/product_model.dart';
import 'package:flutter_l_store/features/shop/screens/product_details/product_detail.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/enums.dart';
import '../../icons/l_circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class LProductCardVertical extends StatelessWidget {
  const LProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = LHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
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
              width: 180,
              padding: const EdgeInsets.all(LSizes.sm),
              backgroundColor: dark ? LColors.dark : LColors.light,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  Center(
                    child: LRoundedImage(
                      imageUrl: product.thumbnail,
                      applyImageRadius: true,
                      isNetworkImage: true,
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
                        '$salePercentage%',
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
            Padding(
              padding: const EdgeInsets.only(left: LSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: LSizes.spaceBtwItems / 2,
                  ),
                  LBrandTitleTextWithVerifiedIcon(title: product.brand!.name)
                ],
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// -- Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: LSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price, Show sale price as main price if sale exist.
                      Padding(
                        padding: const EdgeInsets.only(left: LSizes.sm),
                        child: LProductPriceText(
                          price: controller.getProductPrice(product),
                        ),
                      ),
                    ],
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
