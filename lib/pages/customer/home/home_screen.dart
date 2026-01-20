// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/customer/home/service/service_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: Column(
        children: [
          _topHeader(),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 20.h),
              child: Column(
                children: [
                  _emergencyCard(),
                  25.verticalSpace,
                  _statsRow(),
                  30.verticalSpace,
                  _allServices(),
                  150.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Gradient Header
  Widget _topHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 30.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff4285F4), Color(0xff5A9BFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white),
              6.horizontalSpace,
              Text(
                "Downtown, NYC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.notifications, color: Colors.white),
              ),
            ],
          ),
          20.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search for services...",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🚨 Emergency CTA
  Widget _emergencyCard() {
    return GestureDetector(
      onTap: () => Get.to(() => const ServiceDetailScreen()),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xffFF6A6A), Color(0xffFF3D3D)],
          ),
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withOpacity(0.25),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.warning, color: Colors.red),
            ),
            15.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Emergency Services",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "24/7 Priority Response",
                  style: TextStyle(color: Colors.white70, fontSize: 13.sp),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.white),
          ],
        ),
      ),
    );
  }

  /// 📊 Stats
  Widget _statsRow() {
    return SizedBox(
      height: 125.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          _statCard("4.8", "Avg Rating", Icons.star, Colors.orange),
          _statCard("30 min", "Response", Icons.timer, Colors.blue),
          _statCard("250+", "Services", Icons.build, Colors.green),
          _statCard("99%", "Satisfaction", Icons.thumb_up, Colors.purple),
        ],
      ),
    );
  }

  Widget _statCard(String title, String subtitle, IconData icon, Color color) {
    return Container(
      width: 110.w,
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          8.verticalSpace,
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// 🛠 Services
  Widget _allServices() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Services",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          10.verticalSpace,
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero, // 🔑 MOST IMPORTANT
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.9, // 🔧 height control
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              final items = [
                _serviceItem(Icons.flash_on, "Electrician", Colors.orange),
                _serviceItem(Icons.plumbing, "Plumber", Colors.blue),
                _serviceItem(Icons.ac_unit, "AC Service", Colors.cyan),
                _serviceItem(Icons.cleaning_services, "Cleaning", Colors.green),
                _serviceItem(Icons.construction, "Repair", Colors.purple),
                _serviceItem(Icons.more_horiz, "More", Colors.grey),
              ];
              return items[index];
            },
          ),
        ],
      ),
    );
  }

  Widget _serviceItem(IconData icon, String title, Color color) {
    return GestureDetector(
      onTap: () => Get.to(() => const ServiceDetailScreen()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color),
            ),
            10.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
