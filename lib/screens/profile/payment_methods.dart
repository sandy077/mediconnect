import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/utils/colors.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

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
          'Payment Methods',
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
          children: [
            // Primary card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Primary Card',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.white.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Visa',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.credit_card_rounded,
                        color: AppColors.white,
                        size: 24.r,
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Text(
                    '••••  ••••  ••••  4532',
                    style: TextStyle(
                      fontSize: 16.sp,
                      letterSpacing: 1.5,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 18.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Card Holder',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.white.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'SARAH JOHNSON',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Expires',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.white.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            '12/25',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Other methods
            _PaymentTile(
              icon: Icons.credit_card_rounded,
              iconColor: const Color(0xff4C6FFF),
              title: 'Mastercard',
              subtitle: '•••• 8765',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mastercard selected')),
                );
              },
            ),
            SizedBox(height: 10.h),
            _PaymentTile(
              icon: Icons.phone_iphone_rounded,
              iconColor: const Color(0xffBB6BD9),
              title: 'Apple Pay',
              subtitle: 'Connected',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Apple Pay selected')),
                );
              },
            ),
            SizedBox(height: 16.h),
            // Add new payment method
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add new payment method')),
                );
              },
              child: Container(
                height: 54.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(
                    color: AppColors.primaryColor.withOpacity(0.4),
                    style: BorderStyle.solid,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Text(
                    '+  Add New Payment Method',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                size: 20.r,
                color: iconColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTxt,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.hintTxtColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.more_horiz_rounded,
              size: 20.r,
              color: AppColors.hintTxtColor,
            ),
          ],
        ),
      ),
    );
  }
}