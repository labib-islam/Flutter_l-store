import 'package:flutter/material.dart';
import 'package:flutter_l_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LPrimaryHeaderContainer(child: Column(
              children: [
                /// -- Appbar
                LHomeAppBar(),

                /// -- Searchbar


                /// -- Categories

              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}








