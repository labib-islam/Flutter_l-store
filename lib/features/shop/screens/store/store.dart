import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/common/widgets/appbar/tabbar.dart';
import 'package:flutter_l_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_l_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_l_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter_l_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_l_store/features/shop/controllers/category_controller.dart';
import 'package:flutter_l_store/features/shop/screens/brand/all_brands.dart';
import 'package:flutter_l_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/brands/brand_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    final dark = LHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: LAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            LCartCounterIcon(
              onPressed: () {},
              iconColor: LColors.black,
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? LColors.black : LColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(LSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search Bar
                      const SizedBox(
                        height: LSizes.spaceBtwItems,
                      ),
                      const LSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: LSizes.spaceBtwSections,
                      ),

                      /// -- Featured Brands
                      LSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: LSizes.spaceBtwItems / 1.5,
                      ),

                      LGridLayout(
                          itemCount: 4,
                          mainAxisExtend: 80,
                          itemBuilder: (_, index) {
                            return const LBrandCard(
                              showBorder: true,
                            );
                          })
                    ],
                  ),
                ),

                /// -- Tabs
                bottom: LTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
              )
            ];
          },

          /// -- Body
          body: TabBarView(
            children: categories.map((category) => LCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
