import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key, required this.doctorName, required this.price});

  final String doctorName;
  final String price;

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  late final List<DateTime> _dates;
  int _selectedDateIndex = 0;
  String? _selectedTime;

  final List<String> _morningSlots = [
    '09:00 AM',
    '09:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    
  ];

  final List<String> _afternoonSlots = [
    '12:00 PM',
    '12:30 PM',
    '02:00 PM',
    '02:30 PM',
    '03:00 PM',
    '03:30 PM',
  ];

  final List<String> _eveningSlots = [
    '05:00 PM',
    '05:30 PM',
    '06:00 PM',
    '06:30 PM',
    '07:00 PM',
    '07:30 PM',
    
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dates = List.generate(5, (i) => DateTime(now.year, now.month, now.day).add(Duration(days: i)));
  }

  String get _monthYearLabel {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    final d = _dates[_selectedDateIndex];
    return '${months[d.month - 1]} ${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: AppColors.blackTxt,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Select Date & Time',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackTxt,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _monthYearLabel,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackTxt,
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 72.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _dates.length,
                separatorBuilder: (_, __) => SizedBox(width: 10.w),
                itemBuilder: (context, index) {
                  final d = _dates[index];
                  final isSelected = index == _selectedDateIndex;
                  final weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                  final dayLabel = weekDays[d.weekday - 1];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.primaryColor : AppColors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: isSelected ? AppColors.primaryColor : AppColors.border,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayLabel,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: isSelected ? AppColors.white : AppColors.hintTxtColor,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            d.day.toString().padLeft(2, '0'),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? AppColors.white : AppColors.blackTxt,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Morning',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTxt,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: _morningSlots
                          .map((slot) => _TimeSlotChip(
                                label: slot,
                                selected: _selectedTime == slot,
                                onTap: () {
                                  setState(() {
                                    _selectedTime = slot;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Afternoon',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTxt,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: _afternoonSlots
                          .map((slot) => _TimeSlotChip(
                                label: slot,
                                selected: _selectedTime == slot,
                                onTap: () {
                                  setState(() {
                                    _selectedTime = slot;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Evening',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTxt,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 12.w,
                      runSpacing: 12.h,
                      children: _eveningSlots
                          .map((slot) => _TimeSlotChip(
                                label: slot,
                                selected: _selectedTime == slot,
                                onTap: () {
                                  setState(() {
                                    _selectedTime = slot;
                                  });
                                },
                              ))
                          .toList(),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
        child: SizedBox(
          height: 48.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  _selectedTime == null ? AppColors.border : AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            onPressed: _selectedTime == null
                ? null
                : () {
                    final selectedDate = _dates[_selectedDateIndex];
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Appointment booked with ${widget.doctorName} on '
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year} at $_selectedTime',
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                  },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Confirm Booking',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TimeSlotChip extends StatelessWidget {
  const _TimeSlotChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90.w,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor.withOpacity(0.12) : AppColors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected ? AppColors.primaryColor : AppColors.border,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: selected ? AppColors.primaryColor : AppColors.blackTxt,
          ),
        ),
      ),
    );
  }
}