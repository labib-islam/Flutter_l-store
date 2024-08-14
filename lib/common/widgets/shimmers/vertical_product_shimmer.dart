import 'package:flutter_l_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_l_store/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LVerticalProductShimmer extends StatelessWidget {
  const LVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return LGridLayout(itemCount: itemCount, itemBuilder: (_, __) => const SizedBox(
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          LShimmerEffect(width: 180, height: 180),
          SizedBox(height: LSizes.spaceBtwItems),

          /// Text
          LShimmerEffect(width: 160, height: 15),
          SizedBox(height: LSizes.spaceBtwItems),
          LShimmerEffect(width: 110, height: 15),
        ],
      ),
    ));
  }
}
