import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class LHomeAppBar extends StatelessWidget {
  const LHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: LColors.grey),),
          Text(LTexts.homeAppbarSubTitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: LColors.white),),
        ],
      ),
      actions: [
        LCartCounterIcon(onPressed: (){}, iconColor: LColors.white,)
      ],
    );
  }
}