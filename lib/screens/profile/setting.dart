import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/utils/colors.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _appointmentReminders = true;
  bool _prescriptionRefills = true;
  bool _promotionalEmails = false;
  bool _darkMode = false;

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
          'Settings',
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
            // Notifications
            Container(
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
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTxt,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _SettingSwitchRow(
                    title: 'Appointment Reminders',
                    subtitle: 'Get notified before appointments',
                    value: _appointmentReminders,
                    onChanged: (v) => setState(() => _appointmentReminders = v),
                  ),
                  SizedBox(height: 10.h),
                  _SettingSwitchRow(
                    title: 'Prescription Refills',
                    subtitle: 'Reminders for medication refills',
                    value: _prescriptionRefills,
                    onChanged: (v) => setState(() => _prescriptionRefills = v),
                  ),
                  SizedBox(height: 10.h),
                  _SettingSwitchRow(
                    title: 'Promotional Emails',
                    subtitle: 'Offers and health tips',
                    value: _promotionalEmails,
                    onChanged: (v) => setState(() => _promotionalEmails = v),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Privacy & Security
            Container(
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
                  Text(
                    'Privacy & Security',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTxt,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _SettingNavRow(
                    title: 'Change Password',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Change password tapped')),
                      );
                    },
                  ),
                  _SettingNavRow(
                    title: 'Two-Factor Authentication',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('2FA tapped')),
                      );
                    },
                  ),
                  _SettingNavRow(
                    title: 'Privacy Policy',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Privacy policy tapped')),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Preferences
            Container(
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
                  Text(
                    'Preferences',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackTxt,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _SettingValueRow(
                    title: 'Language',
                    value: 'English',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Change language tapped')),
                      );
                    },
                  ),
                  _SettingValueRow(
                    title: 'Time Zone',
                    value: 'EST',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Change time zone tapped')),
                      );
                    },
                  ),
                  _SettingSwitchRow(
                    title: 'Dark Mode',
                    subtitle: '',
                    value: _darkMode,
                    onChanged: (v) => setState(() => _darkMode = v),
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

class _SettingSwitchRow extends StatelessWidget {
  const _SettingSwitchRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackTxt,
                ),
              ),
              if (subtitle.isNotEmpty) ...[
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.hintTxtColor,
                  ),
                ),
              ],
            ],
          ),
        ),
        Switch(
          value: value,
          activeColor: AppColors.white,
          activeTrackColor: AppColors.primaryColor,
          onChanged: onChanged,
        ),
      ],
    );
  }
}

class _SettingNavRow extends StatelessWidget {
  const _SettingNavRow({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
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

class _SettingValueRow extends StatelessWidget {
  const _SettingValueRow({
    required this.title,
    required this.value,
    required this.onTap,
  });

  final String title;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.blackTxt,
              ),
            ),
            Row(
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.hintTxtColor,
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14.r,
                  color: AppColors.hintTxtColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}