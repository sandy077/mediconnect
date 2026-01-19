import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/screens/detailed_screen/all_categories.dart';
import 'package:mediconnect/screens/detailed_screen/all_doc_screen.dart';

import '../utils/colors.dart';
import 'detailed_screen/doctor_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  String _searchQuery = '';

  final List<_DoctorData> _allDoctors = [
    const _DoctorData(
      name: 'Dr. Emily Stone',
      specialty: "Cardiologist · St. Mary's Hospital",
      price: '\$45/visit',
      rating: '4.9',
      imagePath: 'assets/doc/doc4.jpeg',
    ),
    const _DoctorData(
      name: 'Dr. James Wilson',
      specialty: 'Neurologist · City Clinic',
      price: '\$60/visit',
      rating: '4.9',
      imagePath: 'assets/doc/doc2.jpeg',
    ),
    const _DoctorData(
      name: 'Dr. Maria Garcia',
      specialty: 'Pediatrician · Kids Care Center',
      price: '\$55/visit',
      rating: '4.8',
      imagePath: 'assets/doc/doc3.jpeg',
    ),
  ];

  List<_DoctorData> get _filteredDoctors {
    final query = _searchQuery.trim().toLowerCase();
    if (query.isEmpty) {
      return _allDoctors;
    }
    return _allDoctors.where((doc) {
      final name = doc.name.toLowerCase();
      final specialty = doc.specialty.toLowerCase();
      return name.contains(query) || specialty.contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _HomeHeader(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
        Expanded(
          child: _HomeBody(
            doctors: _filteredDoctors,
          ),
        ),
      ],
    );
  }
}

class _DoctorData {
  const _DoctorData({
    required this.name,
    required this.specialty,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  final String name;
  final String specialty;
  final String price;
  final String rating;
  final String imagePath;
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 50.h,
        bottom: 26.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28.r),
          bottomRight: Radius.circular(28.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Sarah Johnson',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Container(
                width: 34.r,
                height: 34.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.withOpacity(0.18),
                ),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.white,
                  size: 20.r,
                ),
              ),
            ],
          ),
          SizedBox(height: 22.h),
          Container(
            height: 44.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search_rounded,
                  color: AppColors.hintTxtColor,
                  size: 20.r,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextFormField(
                    onTapOutside: (PointerDownEvent event) {
                      FocusScope.of(context).unfocus();
                    },
                    controller: controller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: 'Search any keywords ...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.hintTxtColor,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.blackTxt,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    required this.doctors,
  });

  final List<_DoctorData> doctors;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTxt,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AllCategories(),
                  ),
                ),
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _CategoryItem(
                icon: Icons.medical_services_rounded,
                label: 'General',
              ),
              _CategoryItem(
                icon: Icons.favorite_rounded,
                label: 'Cardio',
              ),
              _CategoryItem(
                icon: Icons.mood_rounded,
                label: 'Dentist',
              ),
              _CategoryItem(
                icon: Icons.psychology_rounded,
                label: 'Neuro',
              ),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Doctors',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTxt,
                ),
              ),
              InkWell(
                onTap:  ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AllDocScreen())),
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: doctors.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final doc = doctors[index];
                return _DoctorCard(
                  name: doc.name,
                  specialty: doc.specialty,
                  price: doc.price,
                  rating: doc.rating,
                  imagePath: doc.imagePath,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56.r,
          height: 56.r,
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 26.r,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            color: AppColors.black,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}

class _DoctorCard extends StatelessWidget {
  const _DoctorCard({
    required this.name,
    required this.specialty,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  final String name;
  final String specialty;
  final String price;
  final String rating;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DoctorDetailScreen(
              name: name,
              specialty: specialty,
              price: price,
              rating: rating,
              imagePath: imagePath,
            ),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r)
        ),
        child: Container(
          padding: EdgeInsets.all(12.r),
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
          child: Row(
            children: [
              Container(
                width: 60.r,
                height: 60.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackTxt,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFEFD3),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rounded,
                                size: 14.r,
                                color: const Color(0xffF6A700),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                rating,
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackTxt,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      specialty,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: AppColors.hintTxtColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.indicatorColor,
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Book',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
