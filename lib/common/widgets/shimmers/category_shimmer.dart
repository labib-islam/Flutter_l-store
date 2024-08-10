import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/shimmers/shimmer.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';

class LCategoryShimmer extends StatelessWidget {
  const LCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) =>
            const SizedBox(width: LSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              LShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: LSizes.spaceBtwItems / 2),

              /// Text
              LShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
