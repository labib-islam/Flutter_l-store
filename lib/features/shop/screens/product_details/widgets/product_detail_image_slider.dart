import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/l_circular_icon.dart';
import '../../../../../common/widgets/images/l_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class LProductImageSlider extends StatelessWidget {
  const LProductImageSlider({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return LCurvedEdgeWidget(
      child: Container(
        color: dark ? LColors.darkerGrey : LColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(LSizes.productImageRadius * 2),
                child: Center(
                  child:
                  Image(image: AssetImage(LImages.productImage5)),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: LSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: LSizes.spaceBtwItems),
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (_, index) => LRoundedImage(
                      width: 80,
                      backgroundColor:
                      dark ? LColors.dark : LColors.white,
                      border: Border.all(color: LColors.primary),
                      padding: const EdgeInsets.all(LSizes.sm),
                      imageUrl: LImages.productImage3,
                    )),
              ),
            ),

            /// Appbar Icons
            const LAppBar(
              showBackArrow: true,
              actions: [LCircularIcon(icon: Iconsax.heart5, color: Colors.red,)],
            )

          ],
        ),
      ),
    );
  }
}
