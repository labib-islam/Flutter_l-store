import 'package:flutter/material.dart';
import 'package:flutter_l_store/common/widgets/appbar/appbar.dart';
import 'package:flutter_l_store/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_l_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter_l_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(LSizes.defaultSpace),
          child: LSortableProducts(),
        ),
      ),
    );
  }
}


