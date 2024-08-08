import 'package:flutter/material.dart';
import 'package:flutter_l_store/features/authentication/controllers/login/login_controller.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class LSocialButtons extends StatelessWidget {
  const LSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: LColors.grey)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(
              width: LSizes.iconMd,
              height: LSizes.iconMd,
              image: AssetImage(LImages.google),
            ),
          ),
        ),
        const SizedBox(width: LSizes.spaceBtwItems,),
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: LColors.grey)),
          child: IconButton(
            onPressed: (){},
            icon: const Image(
              width: LSizes.iconMd,
              height: LSizes.iconMd,
              image: AssetImage(LImages.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
