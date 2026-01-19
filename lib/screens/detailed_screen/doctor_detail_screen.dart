import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import 'book_appointment_screen.dart';

class DoctorDetailScreen extends StatelessWidget {
  final String name;
  final String specialty;
  final String price;
  final String rating;
  final String imagePath;

  const DoctorDetailScreen({
    super.key,
    required this.name,
    required this.specialty,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkWhite,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios_new_rounded),
      //     color: AppColors.blackTxt,
      //     onPressed: () => Navigator.of(context).pop(),
      //   ),
      // ),
      body: SafeArea(
        minimum: EdgeInsets.all(0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 20.h,),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24.r), bottomRight: Radius.circular(24.r)),
                    child: AspectRatio(
                      aspectRatio: 3 / 2,
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    left: 12,
                  top: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white54,
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon:  Icon(Icons.arrow_back_ios_new_rounded,size: 18.sp,),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackTxt,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            specialty,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.hintTxtColor,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            '8 Years Experience',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.hintTxtColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE7F9EF),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: const Color(0xff1BA57A),
                            size: 16.r,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            rating,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTxt,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _StatCard(
                      label: 'Patients',
                      value: '100+',
                      icon: Icons.people_alt_rounded,
                      color: const Color(0xffEEF4FF),
                    ),
                    _StatCard(
                      label: 'Awards',
                      value: '10+',
                      icon: Icons.emoji_events_rounded,
                      color: const Color(0xffE6F8EE),
                    ),
                    _StatCard(
                      label: 'Rating',
                      value: rating,
                      icon: Icons.star_rounded,
                      color: const Color(0xffFFF3E5),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'About Doctor',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTxt,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '$name is a top specialist at${specialty.split("·").last.toString()}. $name has achieved several awards for their wonderful contribution in the field of ${specialty.split("·").first}and is available for private consultation.',
                  style: TextStyle(
                    fontSize: 12.sp,
                    height: 1.5,
                    color: AppColors.hintTxtColor,
                  ),
                ),
                SizedBox(height: 22.h),
                Text(
                  'Working Hours',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTxt,
                  ),
                ),
                SizedBox(height: 10.h),
                _WorkingHoursRow(days: 'Mon - Fri', time: '09:00 AM - 08:00 PM'),
                SizedBox(height: 6.h),
                _WorkingHoursRow(days: 'Sat - Sun', time: '10:00 AM - 06:00 PM'),
                SizedBox(height: 80.h),
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
        child: SizedBox(
          height: 48.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BookAppointmentScreen(
                    doctorName: name,
                    price: price,
                  ),
                ),
              );
            },
            child: Text(
              'Book Appointment',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20.r, color: AppColors.primaryColor),
          SizedBox(height: 6.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.blackTxt,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            label,
            style: TextStyle(fontSize: 11.sp, color: AppColors.hintTxtColor),
          ),
        ],
      ),
    );
  }
}

class _WorkingHoursRow extends StatelessWidget {
  const _WorkingHoursRow({required this.days, required this.time});

  final String days;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          days,
          style: TextStyle(fontSize: 12.sp, color: AppColors.hintTxtColor),
        ),
        Text(
          time,
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
