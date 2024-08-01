import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/texts/l_brand_title_text.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/enums.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';



class LBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const LBrandTitleTextWithVerifiedIcon(
      {super.key,
      required this.title,
      this.maxLines = 1,
      this.textColor,
      this.iconColor = LColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: LBrandTitleText(
              title: title,
              color: textColor,
              maxLines: maxLines,
              textAlign: textAlign,
              brandTextSize: brandTextSize,
            )
        ),
        const SizedBox(width: LSizes.xs,),
        Icon(Iconsax.verify5, color: iconColor, size: LSizes.iconXs)
      ],
    );
  }
}
