import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_l_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_l_store/common/widgets/texts/section_heading.dart';

import '../../../../../common/widgets/brands/brand_show_case.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class LCategoryTab extends StatelessWidget {
  const LCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const TBrandShowcase(images: [LImages.productImage3, LImages.productImage2, LImages.productImage1],),
              const SizedBox(height: LSizes.spaceBtwItems,),

              /// -- Products
              LSectionHeading(title: 'You might like', onPressed: () {},),
              const SizedBox(height: LSizes.spaceBtwItems,),

              LGridLayout(itemCount: 4, itemBuilder: (_, index) => const LProductCardVertical()),
              const SizedBox(height: LSizes.spaceBtwSections,)

            ],
          ),
        ),
      ]

    );
  }
}
