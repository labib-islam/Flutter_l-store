import 'package:flutter/material.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../images/l_circular_image.dart';
import '../texts/l_brand_title_text_with_verified_icon.dart';
import '../custom_shapes/containers/rounded_container.dart';

class LBrandCard extends StatelessWidget {
  const LBrandCard({
    super.key,
    required this.showBorder, this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: LRoundedContainer(
        padding: const EdgeInsets.all(LSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: LCircularImage(
                isNetworkImage: false,
                image: LImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark
                    ? LColors.white
                    : LColors.black,
              ),
            ),
            const SizedBox(
              width: LSizes.spaceBtwItems / 2,
            ),

            /// -- Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  const LBrandTitleTextWithVerifiedIcon(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
