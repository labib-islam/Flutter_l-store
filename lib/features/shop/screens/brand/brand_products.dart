import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/common/widgets/brands/brand_card.dart';
import 'package:flutter_l_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(LSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Details
              LBrandCard(showBorder: true),
              SizedBox(height: LSizes.spaceBtwSections),

              LSortableProducts(),
            ],
          )
        ),
      ),
    );
  }
}
