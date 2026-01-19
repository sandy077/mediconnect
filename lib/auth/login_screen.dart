import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../screens/main_nav_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.primaryColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 68.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 84.r,
                    height: 84.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white,
                    ),
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: AppColors.primaryColor,
                      size: 40.r,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'MediConnect',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Your health, just a click away.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.whiteTxt,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _InputField(
                          icon: Icons.mail_outline,
                          hint: 'user@mediconnect.com',
                        ),
                        SizedBox(height: 14.h),
                        _InputField(
                          icon: Icons.lock_outline,
                          hint: '••••••••',
                          obscure: true,
                        ),
                        SizedBox(height: 18.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.white,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 13.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            onPressed: () {
                              Get.offAllNamed(MainNavScreen.routeName);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h),
                        Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.white.withOpacity(0.9),
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.icon,
    required this.hint,
    this.obscure = false,
  });

  final IconData icon;
  final String hint;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.secondary.withOpacity(0.7),
      ),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.white,
            size: 20.r,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: TextField(
              obscureText: obscure,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14.sp,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: AppColors.white.withOpacity(0.9),
                  fontSize: 13.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

