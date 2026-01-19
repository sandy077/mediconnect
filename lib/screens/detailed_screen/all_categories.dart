import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/screens/detailed_screen/all_doc_screen.dart';
import 'package:mediconnect/utils/colors.dart';

class AllCategories extends StatefulWidget {
  const AllCategories({super.key});

  @override
  State<AllCategories> createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  final TextEditingController _searchController = TextEditingController();

  final List<_CategoryData> _allCategories = const [
    _CategoryData(
      title: 'General Physician',
      subtitle: '120+ Doctors',
      icon: Icons.medical_services_rounded,
      bgColor: Color(0xffEEF4FF),
      iconColor: Color(0xff4C6FFF),
    ),
    _CategoryData(
      title: 'Cardiologist',
      subtitle: '85+ Doctors',
      icon: Icons.favorite_rounded,
      bgColor: Color(0xffFFEFF3),
      iconColor: Color(0xffFF5C7A),
    ),
    _CategoryData(
      title: 'Dentist',
      subtitle: '95+ Doctors',
      icon: Icons.mood_rounded,
      bgColor: Color(0xffFFF5E8),
      iconColor: Color(0xffFF9F2E),
    ),
    _CategoryData(
      title: 'Neurologist',
      subtitle: '62+ Doctors',
      icon: Icons.psychology_rounded,
      bgColor: Color(0xffF3ECFF),
      iconColor: Color(0xff9B51E0),
    ),
    _CategoryData(
      title: 'Pediatrician',
      subtitle: '78+ Doctors',
      icon: Icons.child_care_rounded,
      bgColor: Color(0xffFFEFF5),
      iconColor: Color(0xffFF7AA2),
    ),
    _CategoryData(
      title: 'Ophthalmologist',
      subtitle: '54+ Doctors',
      icon: Icons.remove_red_eye_rounded,
      bgColor: Color(0xffECFFF6),
      iconColor: Color(0xff00C48C),
    ),
    _CategoryData(
      title: 'Orthopedic',
      subtitle: '67+ Doctors',
      icon: Icons.accessibility_new_rounded,
      bgColor: Color(0xffFFF7EC),
      iconColor: Color(0xffFF8A34),
    ),
    _CategoryData(
      title: 'Dermatologist',
      subtitle: '71+ Doctors',
      icon: Icons.water_drop_rounded,
      bgColor: Color(0xffEEF7FF),
      iconColor: Color(0xff2D9CDB),
    ),
    _CategoryData(
      title: 'ENT Specialist',
      subtitle: '49+ Doctors',
      icon: Icons.hearing_rounded,
      bgColor: Color(0xffF5F0FF),
      iconColor: Color(0xffBB6BD9),
    ),
    _CategoryData(
      title: 'Gynecologist',
      subtitle: '58+ Doctors',
      icon: Icons.pregnant_woman_rounded,
      bgColor: Color(0xffFFF0F3),
      iconColor: Color(0xffEB5757),
    ),
    _CategoryData(
      title: 'Psychiatrist',
      subtitle: '43+ Doctors',
      icon: Icons.medication_rounded,
      bgColor: Color(0xffFFF8EC),
      iconColor: Color(0xffF2C94C),
    ),
    _CategoryData(
      title: 'Urologist',
      subtitle: '36+ Doctors',
      icon: Icons.opacity_rounded,
      bgColor: Color(0xffF4FFEC),
      iconColor: Color(0xff6FCF97),
    ),
  ];

  String _searchQuery = '';

  List<_CategoryData> get _filteredCategories {
    final q = _searchQuery.trim().toLowerCase();
    if (q.isEmpty) return _allCategories;
    return _allCategories
        .where((c) => c.title.toLowerCase().contains(q))
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
          'All Categories',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackTxt,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 12.h),
            child: Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: AppColors.black.withValues(alpha: 0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
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
                        controller: _searchController,
                        onChanged: (value) {
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        onTapOutside: (event) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Search specialty...',
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
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              child: GridView.builder(
                itemCount: _filteredCategories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  final item = _filteredCategories[index];
                  return _CategoryCard(data: item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryData {
  const _CategoryData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.data,
  });

  final _CategoryData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AllDocScreen())),
      child: Card(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  color: data.bgColor,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Icon(
                  data.icon,
                  color: data.iconColor,
                  size: 22.r,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                data.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackTxt,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                data.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.hintTxtColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}