import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/utils/colors.dart';

class Help extends StatelessWidget {
  const Help({super.key});

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
          'Help & Support',
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
            _SupportCard(
              icon: Icons.chat_bubble_outline_rounded,
              iconColor: const Color(0xff27AE60),
              title: 'Live Chat',
              subtitle: 'Chat with our support team',
              buttonLabel: 'Start Chat',
              buttonColor: const Color(0xffE9FFF4),
              buttonTextColor: const Color(0xff27AE60),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Starting chat...')),
                );
              },
            ),
            SizedBox(height: 12.h),
            _SupportCard(
              icon: Icons.call_rounded,
              iconColor: const Color(0xff2D9CDB),
              title: 'Call Support',
              subtitle: 'Available 24/7',
              buttonLabel: 'Call Now',
              buttonColor: const Color(0xffE9F3FF),
              buttonTextColor: const Color(0xff2D9CDB),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Calling support...')),
                );
              },
            ),
            SizedBox(height: 12.h),
            _SupportCard(
              icon: Icons.email_outlined,
              iconColor: const Color(0xffBB6BD9),
              title: 'Email Support',
              subtitle: 'Response within 24 hours',
              buttonLabel: 'Send Email',
              buttonColor: const Color(0xffF5ECFF),
              buttonTextColor: const Color(0xffBB6BD9),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Opening email client...')),
                );
              },
            ),
            SizedBox(height: 18.h),
            Text(
              'FAQs',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackTxt,
              ),
            ),
            SizedBox(height: 10.h),
            _FaqItem(
              question: 'How to book an appointment?',
            ),
            _FaqItem(
              question: 'How to cancel an appointment?',
            ),
            _FaqItem(
              question: 'Payment & refund policy',
            ),
            _FaqItem(
              question: 'How to use video consultation?',
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportCard extends StatelessWidget {
  const _SupportCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.onPressed,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final String buttonLabel;
  final Color buttonColor;
  final Color buttonTextColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.r),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32.r,
                height: 32.r,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 18.r,
                ),
              ),
              SizedBox(width: 10.w),
              Column(
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
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.hintTxtColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),
              onPressed: onPressed,
              child: Text(
                buttonLabel,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: buttonTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqItem extends StatelessWidget {
  const _FaqItem({
    required this.question,
  });

  final String question;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(question)),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              question,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.blackTxt,
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