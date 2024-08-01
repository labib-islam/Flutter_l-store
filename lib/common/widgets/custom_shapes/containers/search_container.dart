import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LSearchContainer extends StatelessWidget {
  const LSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: LSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: padding,
          child: Container(
          width: LDeviceUtils.getScreenWidth(context),
      padding: const EdgeInsets.all(LSizes.md),
      decoration: BoxDecoration(
        color: showBackground
            ? dark
            ? LColors.dark
            : LColors.light
            : Colors.transparent,
        borderRadius: BorderRadius.circular(LSizes.cardRadiusLg),
        border: showBorder ? Border.all(color: LColors.grey) : null,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: LColors.darkerGrey,
          ),
          const SizedBox(
            width: LSizes.spaceBtwItems,
          ),
          Text(
            text,
            style: Theme
                .of(context)
                .textTheme
                .bodySmall,
          )
        ],
      ),
    ),)
    ,
    );
  }
}
