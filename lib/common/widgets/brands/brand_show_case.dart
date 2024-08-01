import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'brand_card.dart';
import '../custom_shapes/containers/rounded_container.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return LRoundedContainer(
      showBorder: true,
      borderColor: LColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: LSizes.spaceBtwItems),
      padding: const EdgeInsets.all(LSizes.md),
      child: Column(
        children: [
          /// Brand with Products Count
          const LBrandCard(showBorder: false),
          const SizedBox(height: LSizes.spaceBtwItems,),

          /// Brand Top 3 Product Images
          Row(
            children: images.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Expanded(
      child: LRoundedContainer(
        height: 100,
        backgroundColor: dark ? LColors.darkerGrey : LColors.light,
        margin: const EdgeInsets.only(right: LSizes.sm),
        padding: const EdgeInsets.all(LSizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image),),
      ),
    );
  }

}
