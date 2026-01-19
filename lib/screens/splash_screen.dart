import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(LoginScreen.routeName);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryColor,
              AppColors.secondary,
              AppColors.splashNew4,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -120.h,
              right: -80.w,
              child: Container(
                width: 260.w,
                height: 260.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.splashNew1,
                ),
              ),
            ),
            Positioned(
              bottom: -140.h,
              left: -100.w,
              child: Container(
                width: 320.w,
                height: 320.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.splashNew2,
                ),
              ),
            ),
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(18.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withOpacity(0.1),
                        border: Border.all(
                          color: AppColors.white.withOpacity(0.4),
                          width: 1.4,
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(18.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withOpacity(0.16),
                        ),
                        child: Icon(
                          Icons.health_and_safety_rounded,
                          size: 64.r,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Text(
                      'MediConnect',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Smart doctor appointments, seamlessly managed.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.85),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
