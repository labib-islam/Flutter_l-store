import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/common/widgets/icons/l_circular_icon.dart';
import 'package:flutter_l_store/common/widgets/images/l_rounded_image.dart';
import 'package:flutter_l_store/common/widgets/texts/l_brand_title_text_with_verified_icon.dart';
import 'package:flutter_l_store/common/widgets/texts/product_price_text.dart';
import 'package:flutter_l_store/common/widgets/texts/product_title_text.dart';
import 'package:flutter_l_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_l_store/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: LAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(LSizes.defaultSpace),

        /// -- Items in Cart
        child: LCartItems()
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(()=> const CheckoutScreen()),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
