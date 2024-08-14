import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/common/widgets/icons/l_circular_icon.dart';
import 'package:flutter_l_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_l_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_l_store/features/shop/models/product_model.dart';
import 'package:flutter_l_store/features/shop/screens/home/home.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          LCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              LGridLayout(itemCount: 4, itemBuilder: (_, index) => LProductCardVertical(product: ProductModel.empty(),))
            ],
          ),
        ),
      ),
    );
  }
}
