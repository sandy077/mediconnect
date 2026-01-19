import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/colors.dart';
import 'screens/splash_screen.dart';
import 'auth/login_screen.dart';
import 'screens/main_nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MediConnect',
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            scaffoldBackgroundColor: AppColors.white,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
              primary: AppColors.primaryColor,
              secondary: AppColors.secondary,
            ),
            useMaterial3: true,
            textTheme: GoogleFonts.interTextTheme(),
          ),
          initialRoute: SplashScreen.routeName,
          getPages: [
            GetPage(
              name: SplashScreen.routeName,
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: LoginScreen.routeName,
              page: () => const LoginScreen(),
            ),
            GetPage(
              name: MainNavScreen.routeName,
              page: () => const MainNavScreen(),
            ),
          ],
        );
      },
    );
  }
}
