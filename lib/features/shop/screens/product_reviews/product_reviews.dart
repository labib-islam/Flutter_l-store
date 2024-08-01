import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter_l_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';

import '../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const LAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and reviews are verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: LSizes.spaceBtwItems),

              /// Overall Product Ratings
              const LOverallProductRating(),
              const LRatingBarIndicator(rating: 3.6,),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: LSizes.spaceBtwSections),

              /// User Reviews List
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}

