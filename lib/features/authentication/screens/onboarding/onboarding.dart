import 'package:flutter/material.dart';
import 'package:flutter_l_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter_l_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:flutter_l_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:flutter_l_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:flutter_l_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/device/device_utility.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: LImages.onBoardingImage1,
                title: LTexts.onBoardingTitle1,
                subTitle: LTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: LImages.onBoardingImage2,
                title: LTexts.onBoardingTitle2,
                subTitle: LTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: LImages.onBoardingImage3,
                title: LTexts.onBoardingTitle3,
                subTitle: LTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}


