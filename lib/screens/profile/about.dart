import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/utils/colors.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.blackTxt,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'About',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackTxt,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 72.r,
                    height: 72.r,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.medical_services_rounded,
                      color: AppColors.primaryColor,
                      size: 32.r,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    'MediConnect',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackTxt,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'v1.0.0',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.hintTxtColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Your smart companion for booking and managing doctor appointments.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.hintTxtColor,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              'About MediConnect',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackTxt,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'MediConnect helps you discover trusted doctors, view detailed profiles, and book appointments in just a few taps. Track your upcoming visits, review past consultations, and keep your medical information organised in one place.',
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.hintTxtColor,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Key Features',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackTxt,
              ),
            ),
            SizedBox(height: 10.h),
            _BulletRow('Search and filter doctors by specialty and hospital.'),
            _BulletRow('View rich doctor profiles with ratings, experience, and working hours.'),
            _BulletRow('Book and reschedule appointments with flexible time slots.'),
            _BulletRow('Access medical history, prescriptions, and visit details in one place.'),
            _BulletRow('Secure communication with doctors via chat and video calls.'),
            SizedBox(height: 24.h),
            Text(
              'Contact & Support',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackTxt,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  size: 16.r,
                  color: AppColors.hintTxtColor,
                ),
                SizedBox(width: 6.w),
                Text(
                  'support@mediconnect.app',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.hintTxtColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              children: [
                Icon(
                  Icons.language_rounded,
                  size: 16.r,
                  color: AppColors.hintTxtColor,
                ),
                SizedBox(width: 6.w),
                Text(
                  'www.mediconnect.app',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.hintTxtColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Center(
              child: Text(
                ' 2025 MediConnect. All rights reserved.',
                style: TextStyle(
                  fontSize: 11.sp,
                  color: AppColors.hintTxtColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BulletRow extends StatelessWidget {
  const _BulletRow(this.text, );

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5.r,
            height: 5.r,
            margin: EdgeInsets.only(top: 6.h),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.hintTxtColor,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}