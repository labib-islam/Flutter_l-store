import 'package:flutter/material.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
import 'package:flutter_l_store/utils/device/device_utility.dart';
import 'package:flutter_l_store/utils/helpers/helper_functions.dart';

class LTabBar extends StatelessWidget implements PreferredSizeWidget {
  const LTabBar({super.key, required this.tabs});
  
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = LHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? LColors.black : LColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: LColors.primary,
        labelColor: dark ? LColors.white : LColors.primary,
        unselectedLabelColor: LColors.darkGrey,
        tabs: tabs 
      ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(LDeviceUtils.getAppBarHeight());
}

