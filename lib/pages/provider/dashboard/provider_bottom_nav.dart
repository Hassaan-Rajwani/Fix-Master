// ignore_for_file: deprecated_member_use

import 'package:fix_master/controllers/provider/dashboard/provider_bottom_nav_controller.dart';
import 'package:fix_master/pages/provider/earnings/earning_screen.dart';
import 'package:fix_master/pages/provider/jobs/job_screen.dart';
import 'package:fix_master/pages/provider/setting/provider_setting_screen.dart';
import 'package:fix_master/pages/provider/performance/performance_screen.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProviderBottomNav extends StatefulWidget {
  const ProviderBottomNav({super.key});

  @override
  State<ProviderBottomNav> createState() => _ProviderBottomNavState();
}

class _ProviderBottomNavState extends State<ProviderBottomNav> {
  final bottomNav = Get.put(ProviderBottomNavController());

  final screens = [
    JobScreen(),
    EarningsPage(),
    PerformanceScreen(),
    ProviderSettingScreen(),
  ];

  void onItemTapped(int index) {
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
                    color: AppColor.primaryColor2,
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
                    color: AppColor.primaryColor2,
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
          extendBody: true, // 🔹 makes bottom nav transparent/floating
          body: screens[bottomNav.bottomNavCurrentIndex.value],
          bottomNavigationBar: Container(
            margin: EdgeInsets.all(16.w),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95), // 🔹 slightly transparent
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
                _providerTabItem(
                  index: 0,
                  icon: Icons.work_outline,
                  activeIcon: Icons.work,
                ),
                _providerTabItem(
                  index: 1,
                  icon: Icons.account_balance_wallet_outlined,
                  activeIcon: Icons.account_balance_wallet,
                ),
                _providerTabItem(
                  index: 2,
                  icon: Icons.bar_chart_outlined,
                  activeIcon: Icons.bar_chart,
                ),
                _providerTabItem(
                  index: 3,
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _providerTabItem({
    required int index,
    required IconData icon,
    required IconData activeIcon,
  }) {
    final isSelected = bottomNav.bottomNavCurrentIndex.value == index;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18.w : 12.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColor.primaryColor2.withOpacity(0.10)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Icon(
          isSelected ? activeIcon : icon,
          color: isSelected
              ? AppColor.primaryColor2
              : AppColor.primaryColor2.withOpacity(0.45),
          size: isSelected ? 27.sp : 25.sp,
        ),
      ),
    );
  }
}
