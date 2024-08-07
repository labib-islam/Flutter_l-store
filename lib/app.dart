import 'package:flutter/material.dart';
import 'package:flutter_l_store/bindings/general_bindings.dart';
import 'package:flutter_l_store/features/authentication/screens/login/login.dart';
import 'package:flutter_l_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter_l_store/utils/constants/colors.dart';
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
      initialBinding: GeneralBindings(),
      /// Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding to show relevant screen.
      // home: const LoginScreen()
      home: const Scaffold(
        backgroundColor: LColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
