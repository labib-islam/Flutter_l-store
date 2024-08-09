import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_l_store/features/personalization/controllers/user_controller.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'package:get/get.dart';

class LHomeAppBar extends StatelessWidget {
  const LHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return LAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: LColors.grey),),
          Obx(() {
            if (controller.profileLoading.value) {
              // Display a shimmer loader while user profile is being loaded
              return const LShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: LColors.white),);
            }
          } ),
        ],
      ),
      actions: [
        LCartCounterIcon(onPressed: (){}, iconColor: LColors.white,)
      ],
    );
  }
}