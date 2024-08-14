import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_l_store/features/shop/models/product_model.dart';
import 'package:flutter_l_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutter_l_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:flutter_l_store/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flutter_l_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_l_store/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter_l_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const LBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1 - Product Image Slider
            const LProductImageSlider(),

            /// 2 - Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: LSizes.defaultSpace,
                  left: LSizes.defaultSpace,
                  bottom: LSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share Button
                  const LRatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  const LProductMetaData(),

                  /// -- Attributes
                  const LProductAttributes(),
                  const SizedBox(height: LSizes.spaceBtwSections,),

                  /// -- Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(height: LSizes.spaceBtwSections,),

                  /// - Description
                  const LSectionHeading(title: 'Description', showActionButton: false,),
                  const SizedBox(height: LSizes.spaceBtwItems,),
                  const ReadMoreText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Review
                  const Divider(),
                  const SizedBox(height: LSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const LSectionHeading(title: 'Reviews (199)', showActionButton: false,),
                      IconButton(onPressed: () => Get.to(() => const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3))
                    ],
                  ),
                  const SizedBox(height: LSizes.spaceBtwSections,),

                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

