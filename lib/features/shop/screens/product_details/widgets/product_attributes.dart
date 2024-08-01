import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_l_store/common/widgets/texts/product_price_text.dart';
import 'package:flutter_l_store/common/widgets/texts/product_title_text.dart';
import 'package:flutter_l_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class LProductAttributes extends StatelessWidget {
  const LProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        LRoundedContainer(
          padding: const EdgeInsets.all(LSizes.md),
          backgroundColor: dark ? LColors.darkerGrey : LColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Status
              Row(
                children: [
                  const LSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(width: LSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const LProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),

                          /// Actual Price
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: LSizes.spaceBtwItems),

                          /// Sale Price
                          const LProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const LProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// Variation Description
              const LProductTitleText(
                title:
                    'This is the description of the product and it can go up to max 4 lines.',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: LSizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LSectionHeading(title: 'Colors', showActionButton: false,),
            const SizedBox(
              height: LSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                LChoiceChip(text: 'Green', selected: false, onSelected: (value) {},),
                LChoiceChip(text: 'Blue', selected: true, onSelected: (value) {},),
                LChoiceChip(text: 'Yellow', selected: false, onSelected: (value) {},),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LSectionHeading(title: 'Sizes', showActionButton: false),
            const SizedBox(
              height: LSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                LChoiceChip(text: 'EU 34', selected: true, onSelected: (value) {},),
                LChoiceChip(text: 'EU 36', selected: false, onSelected: (value) {},),
                LChoiceChip(text: 'EU 38', selected: false, onSelected: (value) {},),
              ],
            )
          ],
        ),
      ],
    );
  }
}

