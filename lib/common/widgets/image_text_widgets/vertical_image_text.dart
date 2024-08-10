import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/images/l_circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class LVerticalImageText extends StatelessWidget {
  const LVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.textColor = LColors.white,
    this.isNetworkImage = true,
    this.backgroundColor,
    this.onTap,
  });

  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: LSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            LCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: LSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? LColors.light : LColors.dark,
            ),
            const SizedBox(
              height: LSizes.spaceBtwItems / 2,
            ),

            /// Text
            SizedBox(
              width: 56,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
