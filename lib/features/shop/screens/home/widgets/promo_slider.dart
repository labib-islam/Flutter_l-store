import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_l_store/features/shop/controllers/banner_controller.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/l_rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:get/get.dart';

class LPromoSlider extends StatelessWidget {
  const LPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      // Loader
      if (controller.isLoading.value) return const LShimmerEffect(width: double.infinity, height: 190);

      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found!'));

      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index)),
              items: controller.banners
                  .map((banner) => LRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: banner.imageUrl.isNotEmpty,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: LSizes.spaceBtwItems,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      LCircularContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.carousalCurrentIndex.value == i
                                ? LColors.primary
                                : LColors.grey,
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
