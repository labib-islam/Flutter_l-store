import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/common/widgets/images/l_rounded_image.dart';
import 'package:flutter_l_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:flutter_l_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LAppBar(
        title: Text('Sports'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const LRoundedImage(
                imageUrl: LImages.promoBanner3,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(height: LSizes.spaceBtwSections),

              /// Sub-Categories
              Column(
                children: [
                  /// Heading
                  LSectionHeading(
                    title: 'Sports Shirts',
                    onPressed: () {},
                  ),
                  const SizedBox(height: LSizes.spaceBtwItems),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: LSizes.spaceBtwItems,),
                      itemBuilder: (context, index) =>
                          const LProductCardHorizontal(),

                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
