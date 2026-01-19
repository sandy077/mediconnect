import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_controller.dart';
import '../widgets/main_bottom_nav.dart';
import 'home_screen.dart';
import 'appointments_screen.dart';
import 'chat/messages_screen.dart';
import 'profile/profile_screen.dart';

class MainNavScreen extends StatelessWidget {
  const MainNavScreen({super.key});

  static const String routeName = '/main';

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller =
        Get.put<BottomNavController>(BottomNavController());

    final List<Widget> pages = const [
      HomeScreen(),
      AppointmentsScreen(),
      MessagesScreen(),
      ProfileScreen(),
    ];

    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: AppColors.white,
        //   title: Row(
        //     children: [
        //       Container(
        //         padding: EdgeInsets.all(9.r),
        //         decoration: BoxDecoration(
        //           color: AppColors.primaryColor.withOpacity(0.08),
        //           borderRadius: BorderRadius.circular(12.r),
        //         ),
        //         child: Icon(
        //           Icons.health_and_safety_rounded,
        //           color: AppColors.primaryColor,
        //           size: 22.r,
        //         ),
        //       ),
        //       SizedBox(width: 10.w),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             'MediConnect',
        //             style: TextStyle(
        //               fontSize: 16.sp,
        //               fontWeight: FontWeight.w600,
        //               color: AppColors.blackTxt,
        //             ),
        //           ),
        //           Text(
        //             'Your health, connected',
        //             style: TextStyle(
        //               fontSize: 11.sp,
        //               color: AppColors.hintTxtColor,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.notifications_none_rounded,
        //         color: AppColors.blackTxt,
        //       ),
        //     ),
        //     SizedBox(width: 4.w),
        //   ],
        // ),
       
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: pages[controller.currentIndex.value],
        ),
        bottomNavigationBar: MainBottomNav(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeTab,
        ),
      ),
    );
  }
}
