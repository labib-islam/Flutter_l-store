import 'package:flutter/material.dart';
import 'package:flutter_l_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_l_store/utils/theme/theme.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: LAppTheme.lightTheme,
      darkTheme: LAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}