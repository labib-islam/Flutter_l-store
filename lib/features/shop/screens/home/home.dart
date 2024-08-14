import 'package:flutter/material.dart';

import 'package:flutter_l_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_l_store/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_l_store/features/shop/controllers/product_controller.dart';
import 'package:flutter_l_store/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_l_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_l_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutter_l_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const LPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Appbar
                  LHomeAppBar(),
                  SizedBox(
                    height: LSizes.spaceBtwSections,
                  ),

                  /// -- Searchbar
                  LSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: LSizes.spaceBtwSections,
                  ),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsets.only(left: LSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        LSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: LColors.white,
                        ),
                        SizedBox(
                          height: LSizes.spaceBtwItems,
                        ),

                        /// Categories
                        LHomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: LSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(LSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Slider
                  const LPromoSlider(),
                  const SizedBox(
                    height: LSizes.spaceBtwSections,
                  ),

                  /// -- Heading
                  LSectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(
                    height: LSizes.spaceBtwItems,
                  ),

                  /// -- Popular Products
                  Obx(() {
                    if (controller.isLoading.value)
                      return const LVerticalProductShimmer();
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return LGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) => LProductCardVertical(
                          product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
