import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/screens/detailed_screen/doctor_detail_screen.dart';
import 'package:mediconnect/utils/colors.dart';

// ignore: must_be_immutable
class AllDocScreen extends StatelessWidget {
  AllDocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    void onChanged(String value) {}
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
          'All Doctors',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackTxt,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Container(
              height: 44.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.white,
                border: Border.all(
                  color: AppColors.black.withValues(alpha: 0.3),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                child: TextFormField(
                  onTapOutside: (PointerDownEvent event) {
                    FocusScope.of(context).unfocus();
                  },
                  controller: controller,
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search doctors ...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.hintTxtColor,
                    ),
                  ),
                  style: TextStyle(fontSize: 13.sp, color: AppColors.blackTxt),
                ),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Divider(color: AppColors.black, thickness: 0.2),

          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 8.h,
                  ),
                  child: _DoctorCard(
                    name: data[index].name,
                    specialty: data[index].speciality,
                    price: data[index].price,
                    rating: data[index].rating,
                    imagePath: data[index].images,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<DoctorData> data = [
    DoctorData(
      name: "Dr. Emily Stone",
      speciality: "Cardiologist · St. Mary's Hospital",
      images: "assets/doc/doc4.jpeg",
      price: "\$45",
      rating: "4.9",
    ),
    DoctorData(
      name: "Dr. James Wilson",
      speciality: "Neurologist · City Clinic",
      images: "assets/doc/doc1.jpeg",
      price: "\$60",
      rating: "4.9",
    ),
    DoctorData(
      name: "Dr. Maria Garcia",
      speciality: "Pediatrician · Childeren's Hospital",
      images: "assets/doc/doc3.jpeg",
      price: "\$50",
      rating: "4.7",
    ),
    DoctorData(
      name: "Dr. Robert Chen",
      speciality: "Dentist · Smile Dental Care",
      images: "assets/doc/doc2.jpeg",
      price: "\$55",
      rating: "4.6",
    ),
    DoctorData(
      name: "Dr. Lisa Anderson",
      speciality: "Dermatologist · Skin Care Center",
      images: "assets/doc/doc10.jpeg",
      price: "\$70",
      rating: "4.9",
    ),
    DoctorData(
      name: "Dr. Laura Bennett",
      speciality: "Gynecologist · Women's Health Center",
      images: "assets/doc/doc9.jpeg",
      price: "\$35",
      rating: "4.4",
    ),
    DoctorData(
      name: "Dr. Andrew Collins",
      speciality: "Orthopedic · MotionCare Orthopedic Center",
      images: "assets/doc/doc5.jpeg",
      price: "\$85",
      rating: "4.7",
    ),
    DoctorData(
      name: "Dr. Benjamin Harris",
      speciality: "Ophthalmologists · VisionPoint Eye Institute",
      images: "assets/doc/doc7.jpeg",
      price: "\$30",
      rating: "4.9",
    ),
    DoctorData(
      name: "Dr. Matthew Lewis",
      speciality: "Dermatologist · DermaCare Skin Clinic",
      images: "assets/doc/doc6.jpeg",
      price: "\$55",
      rating: "4.4",
    ),
  ];
}

class DoctorData {
  String name;
  String speciality;
  String images;
  String price;
  String rating;
  DoctorData({
    required this.name,
    required this.speciality,
    required this.images,
    required this.price,
    required this.rating,
  });
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
          borderRadius: BorderRadius.circular(18.r),
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
                child: Image.asset(imagePath, fit: BoxFit.cover),
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
                          "${price}/visit",
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
                              padding: EdgeInsets.symmetric(horizontal: 18.w),
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
                                fontWeight: FontWeight.w600,
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
