import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/utils/colors.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({super.key});

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
          'Medical History',
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
            _SectionCard(
              title: 'Health Information',
              actionLabel: 'Edit',
              onActionTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit health information')),
                );
              },
              child: Column(
                children: [
                  _InfoRow(label: 'Blood Type', value: 'O+'),
                  SizedBox(height: 6.h),
                  _InfoRow(label: 'Height', value: '165 cm'),
                  SizedBox(height: 6.h),
                  _InfoRow(label: 'Weight', value: '58 kg'),
                  SizedBox(height: 6.h),
                  _InfoRow(label: 'BMI', value: '21.3'),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            _SectionCard(
              title: 'Allergies',
              actionLabel: 'Add',
              onActionTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add allergy')),
                );
              },
              child: Column(
                children: [
                  _AllergyChip(
                    name: 'Penicillin',
                    severity: 'Severe',
                    bgColor: const Color(0xffFFF0F0),
                    textColor: const Color(0xffEB5757),
                  ),
                  SizedBox(height: 8.h),
                  _AllergyChip(
                    name: 'Peanuts',
                    severity: 'Moderate',
                    bgColor: const Color(0xffFFF8E6),
                    textColor: const Color(0xffF2C94C),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            _SectionCard(
              title: 'Chronic Conditions',
              actionLabel: 'Add',
              onActionTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add chronic condition')),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ConditionTile(
                    title: 'Asthma',
                    subtitle: 'Since 2015',
                    bgColor: const Color(0xffF0F6FF),
                    icon: Icons.air_rounded,
                    iconColor: const Color(0xff2D9CDB),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),
            _SectionCard(
              title: 'Current Medications',
              actionLabel: 'Add',
              onActionTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Add medication')),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ConditionTile(
                    title: 'Albuterol Inhaler',
                    subtitle: 'As needed',
                    bgColor: const Color(0xffF7F0FF),
                    icon: Icons.medication_rounded,
                    iconColor: const Color(0xffBB6BD9),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.child,
    required this.actionLabel,
    required this.onActionTap,
    
  });

  final String title;
  final Widget child;
  final String actionLabel;
  final VoidCallback onActionTap;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTxt,
                ),
              ),
              GestureDetector(
                onTap: onActionTap,
                child: Text(
                  actionLabel,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.hintTxtColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackTxt,
          ),
        ),
      ],
    );
  }
}

class _AllergyChip extends StatelessWidget {
  const _AllergyChip({
    required this.name,
    required this.severity,
    required this.bgColor,
    required this.textColor,
    
  });

  final String name;
  final String severity;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.error_outline_rounded,
                color: textColor,
                size: 18.r,
              ),
              SizedBox(width: 10.w),
              Text(
                name,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.blackTxt,
                ),
              ),
            ],
          ),
          Text(
            severity,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConditionTile extends StatelessWidget {
  const _ConditionTile({
    required this.title,
    required this.subtitle,
    required this.bgColor,
    required this.icon,
    required this.iconColor,
    
  });

  final String title;
  final String subtitle;
  final Color bgColor;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Container(
            width: 28.r,
            height: 28.r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              icon,
              size: 18.r,
              color: iconColor,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
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
    );
  }
}