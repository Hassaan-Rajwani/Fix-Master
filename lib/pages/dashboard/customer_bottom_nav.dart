// ignore_for_file: deprecated_member_use

import 'package:fix_master/controllers/customer/dashboard/customer_bottom_nav_controller.dart';
import 'package:fix_master/pages/dashboard/booking/booking_screen.dart';
import 'package:fix_master/pages/dashboard/home/home_screen.dart';
import 'package:fix_master/pages/dashboard/setting/setting_screen.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerBottomNav extends StatefulWidget {
  const CustomerBottomNav({super.key});

  @override
  State<CustomerBottomNav> createState() => _CustomerBottomNavState();
}

class _CustomerBottomNavState extends State<CustomerBottomNav> {
  final bottomNav = Get.put(CustomerBottomNavController());

  var screens = [
    HomeScreen(),
    Center(
      child: Text('Search Screen', style: appFont(color: AppColor.whiteColor)),
    ),
    BookingScreen(),
    SettingScreen(),
  ];

  void onItemTaapped(int index) {
    bottomNav.navBarChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            title: Text(
              'Exit App',
              style: appFont(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Are you sure you want to exit?',
              style: appFont(fontSize: 16),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: appFont(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Yes',
                  style: appFont(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
        return shouldExit ?? false;
      },
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: screens[bottomNav.bottomNavCurrentIndex.value],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: BottomAppBar(
              height: 68.h,
              color: AppColor.primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  tabItem(
                    onTap: () => onItemTaapped(0),
                    isSelected: bottomNav.bottomNavCurrentIndex.value == 0,
                    selectedIcon: Icons.home_filled,
                    unSelectedIcon: Icons.home_outlined,
                  ),
                  tabItem(
                    onTap: () => onItemTaapped(1),
                    isSelected: bottomNav.bottomNavCurrentIndex.value == 1,
                    selectedIcon: Icons.search,
                    unSelectedIcon: Icons.search_outlined,
                  ),
                  tabItem(
                    onTap: () => onItemTaapped(2),
                    isSelected: bottomNav.bottomNavCurrentIndex.value == 2,
                    selectedIcon: Icons.calendar_today,
                    unSelectedIcon: Icons.calendar_month_outlined,
                  ),
                  tabItem(
                    onTap: () => onItemTaapped(3),
                    isSelected: bottomNav.bottomNavCurrentIndex.value == 3,
                    selectedIcon: Icons.settings,
                    unSelectedIcon: Icons.settings_outlined,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget tabItem({
  required VoidCallback onTap,
  required bool isSelected,
  required IconData selectedIcon,
  required IconData unSelectedIcon,
}) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isSelected ? selectedIcon : unSelectedIcon,
          size: 26.sp,
          color: isSelected
              ? AppColor.secondaryColor
              : Colors.white.withOpacity(0.8),
        ),
        6.verticalSpace,
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: isSelected ? 14.w : 0,
          height: 2.h,
          decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ),
  );
}
