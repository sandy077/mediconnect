import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/utils/colors.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  String _gender = 'Female';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      appBar: AppBar(
        elevation: 1,
       backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
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
                      width: 28.r,
                      height: 28.r,
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
              ),
              SizedBox(height: 24.h),
              _FieldLabel('Full Name'),
              _TextFieldContainer(
                child: TextFormField(
                  initialValue: 'Sarah Johnson',
                  decoration: _inputDecoration(''),
                  
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 14.h),
              _FieldLabel('Email Address'),
              _TextFieldContainer(
                child: TextFormField(
                  initialValue: 'sarah.johnson@email.com',
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('', prefixIcon: Icons.email_outlined),
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 14.h),
              _FieldLabel('Phone Number'),
              _TextFieldContainer(
                child: TextFormField(
                  initialValue: '+1 (555) 123-4567',
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration('', prefixIcon: Icons.phone_outlined),
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 14.h),
              _FieldLabel('Date of Birth'),
              _TextFieldContainer(
                child: TextFormField(
                  initialValue: 'January 15, 1995',
                  decoration: _inputDecoration('', prefixIcon: Icons.calendar_today_rounded),
                  style: TextStyle(fontSize: 14.sp),
                  readOnly: true,
                ),
              ),
              SizedBox(height: 14.h),
              _FieldLabel('Gender'),
              _TextFieldContainer(
                child: DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: _inputDecoration('', prefixIcon: Icons.person_outline_rounded),
                  
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.hintTxtColor,
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Female', child: Text('Female')),
                    DropdownMenuItem(value: 'Male', child: Text('Male')),
                    DropdownMenuItem(value: 'Other', child: Text('Other')),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _gender = value);
                    }
                  },
                ),
              ),
              SizedBox(height: 14.h),
              _FieldLabel('Address'),
              _TextFieldContainer(
                child: TextFormField(
                  initialValue: '123 Main Street, New York, NY 10001',
                  maxLines: 2,
                  decoration: _inputDecoration('', prefixIcon: Icons.location_on_outlined),
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile changes saved')),
                    );
                  },
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, {IconData? prefixIcon}) {
    return InputDecoration(
      hintText: hint,
      border: InputBorder.none,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      prefixIcon: prefixIcon == null
          ? null
          : Icon(
              prefixIcon,
              size: 18.r,
              color: AppColors.hintTxtColor,
            ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.label, );

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.blackTxt,
      ),
    );
  }
}

class _TextFieldContainer extends StatelessWidget {
  const _TextFieldContainer({required this.child, });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      // margin: EdgeInsets.only(top: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}