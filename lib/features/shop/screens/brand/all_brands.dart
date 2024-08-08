import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_l_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_l_store/common/widgets/texts/section_heading.dart';
import 'package:flutter_l_store/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const LSectionHeading(title: 'Brands', showActionButton: false),
              const SizedBox(height: LSizes.spaceBtwItems),

              /// -- Brand
              LGridLayout(
                itemCount: 10,
                mainAxisExtend: 80,
                itemBuilder: (context, index) =>
                    LBrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProducts()),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
