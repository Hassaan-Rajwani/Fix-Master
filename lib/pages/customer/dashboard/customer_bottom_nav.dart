// ignore_for_file: deprecated_member_use

import 'package:fix_master/controllers/customer/dashboard/customer_bottom_nav_controller.dart';
import 'package:fix_master/pages/customer/booking/booking_screen.dart';
import 'package:fix_master/pages/customer/home/home_screen.dart';
import 'package:fix_master/pages/customer/setting/setting_screen.dart';
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

  final screens = [HomeScreen(), BookingScreen(), SettingScreen()];

  void onItemTapped(int index) {
    bottomNav.navBarChange(index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldExit = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            title: Text(
              'Exit App',
              style: appFont(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: Text(
              'Are you sure you want to exit?',
              style: appFont(fontSize: 15),
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false),
                child: Text(
                  'No',
                  style: appFont(
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Get.back(result: true),
                child: Text(
                  'Yes',
                  style: appFont(
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
          body: screens[bottomNav.bottomNavCurrentIndex.value],
          extendBody: true,
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(16.w),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _tabItem(
                  index: 0,
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home_filled,
                  onTap: onItemTapped,
                ),
                _tabItem(
                  index: 1,
                  icon: Icons.calendar_month_outlined,
                  activeIcon: Icons.calendar_today,
                  onTap: onItemTapped,
                ),
                _tabItem(
                  index: 2,
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                  onTap: onItemTapped,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
    required Function(int) onTap,
  }) {
    final isSelected = bottomNav.bottomNavCurrentIndex.value == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18.w : 12.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.primaryColor.withOpacity(0.10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          isSelected ? activeIcon : icon,
          size: isSelected ? 27.sp : 25.sp,
          color: isSelected
              ? AppColor.primaryColor
              : AppColor.primaryColor.withOpacity(0.45),
        ),
      ),
    );
  }
}
