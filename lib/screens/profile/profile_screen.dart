import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/auth/login_screen.dart';
import 'package:mediconnect/screens/profile/about.dart';
import 'package:mediconnect/screens/profile/edit_profile.dart';
import 'package:mediconnect/screens/profile/help.dart';
import 'package:mediconnect/screens/profile/medical_history.dart';
import 'package:mediconnect/screens/profile/payment_methods.dart';
import 'package:mediconnect/screens/profile/setting.dart';

import '../../utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with teal background and profile avatar
              Container(
                width: double.infinity,
                height: 140.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(28.r),
                    bottomRight: Radius.circular(28.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              // Avatar overlaps header
              Transform.translate(
                offset: Offset(0, -45.h),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 86.r,
                          height: 86.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.white,
                              width: 4.r,
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'assets/doc/user.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 26.r,
                          height: 26.r,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.white, width: 2.r),
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: AppColors.white,
                            size: 14.r,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Sarah Johnson',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTxt,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'sarah.johnson@email.com',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.hintTxtColor,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '+1 (555) 123-4567',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.hintTxtColor,
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _ProfileItemRow(
                            icon: Icons.person_outline_rounded,
                            iconBg: const Color(0xffEEF4FF),
                            iconColor: const Color(0xff4C6FFF),
                            label: 'Edit Profile',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const EditProfile(),
                                ),
                              );
                            },
                          ),
                          const Divider(height: 1),
                          _ProfileItemRow(
                            icon: Icons.favorite_outline_rounded,
                            iconBg: const Color(0xffEAF8F2),
                            iconColor: const Color(0xff27AE60),
                            label: 'Medical History',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const MedicalHistory(),
                                ),
                              );
                            },
                          ),
                          const Divider(height: 1),
                          _ProfileItemRow(
                            icon: Icons.credit_card_rounded,
                            iconBg: const Color(0xffF5ECFF),
                            iconColor: const Color(0xff9B51E0),
                            label: 'Payment Methods',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const PaymentMethods(),
                                ),
                              );
                            },
                          ),
                          const Divider(height: 1),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 32.r,
                                  height: 32.r,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFFF4EA),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Icon(
                                    Icons.notifications_none_rounded,
                                    color: const Color(0xffF2994A),
                                    size: 18.r,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Text(
                                    'Notifications',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.blackTxt,
                                    ),
                                  ),
                                ),
                                Switch(
                                  value: _notificationsEnabled,
                                  activeColor: AppColors.white,
                                  activeTrackColor: AppColors.primaryColor,
                                  onChanged: (value) {
                                    setState(() => _notificationsEnabled = value);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Second card: Settings, Help & Support, About
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _ProfileItemRow(
                            icon: Icons.settings_outlined,
                            iconBg: const Color(0xffEAF2FF),
                            iconColor: const Color(0xff2D9CDB),
                            label: 'Settings',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const Setting(),
                                ),
                              );
                            },
                          ),
                          const Divider(height: 1),
                          _ProfileItemRow(
                            icon: Icons.help_outline_rounded,
                            iconBg: const Color(0xffFFF7E9),
                            iconColor: const Color(0xffF2C94C),
                            label: 'Help & Support',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const Help(),
                                ),
                              );
                            },
                          ),
                          const Divider(height: 1),
                          _ProfileItemRow(
                            icon: Icons.info_outline_rounded,
                            iconBg: const Color(0xffF3F4FF),
                            iconColor: const Color(0xff828BD0),
                            label: 'About',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const About(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18.h),
                    // Logout section
                    InkWell(
                      onTap: ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false),
                      child: Container(
                        height: 55.h,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFF4F2),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(color: const Color(0xffEB5757), width: 1.w),
                        ),
                        child: Center(
                          child: TextButton.icon(
                            onPressed: ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false),
                            icon: Icon(
                              Icons.logout_rounded,
                              color: const Color(0xffEB5757),
                              size: 18.r,
                            ),
                            label: Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffEB5757),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileItemRow extends StatelessWidget {
  const _ProfileItemRow({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 32.r,
              height: 32.r,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 18.r,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.blackTxt,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14.r,
              color: AppColors.hintTxtColor,
            ),
          ],
        ),
      ),
    );
  }
}
