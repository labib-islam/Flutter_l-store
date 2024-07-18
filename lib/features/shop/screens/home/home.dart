import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_l_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_l_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/constants/text_strings.dart';
import 'package:flutter_l_store/utils/device/device_utility.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LPrimaryHeaderContainer(
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


