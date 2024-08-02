import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:flutter_l_store/common/widgets/success_screen/success_screen.dart';
import 'package:flutter_l_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_l_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:flutter_l_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:flutter_l_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter_l_store/navigation_menu.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/image_strings.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: LAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const LCartItems(showAddRemoveButtons: false),
              const SizedBox(height: LSizes.spaceBtwSections),

              /// -- Coupon TextField
              const LCouponCode(),
              const SizedBox(
                height: LSizes.spaceBtwSections,
              ),

              /// -- Billing Section
              LRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(LSizes.md),
                backgroundColor: dark ? LColors.black : LColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    LBillingAmountSection(),
                    SizedBox(height: LSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: LSizes.spaceBtwItems),

                    /// Payment Method
                    LBillingPaymentSection(),
                    SizedBox(height: LSizes.spaceBtwItems),

                    /// Address
                    LBillingAddressSection(),
                  ],
                ),
              )

            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(LSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(()=> SuccessScreen(image: LImages.successfulPaymentIcon, title: 'Payment Success!', subtitle: 'Your item will be shipped soon!', onPressed: () => Get.offAll(() => const NavigationMenu()))),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}

