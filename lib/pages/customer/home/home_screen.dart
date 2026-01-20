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
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  _emergencyCard(),
                  SizedBox(height: 20.h),
                  _statsRow(),
                  SizedBox(height: 30.h),
                  _allServices(),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔵 Top Blue Header
  Widget _topHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 25.h),
      decoration: const BoxDecoration(
        color: Color(0xff4285F4),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white),
              SizedBox(width: 6.w),
              Text(
                "Downtown, NYC",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.2),
                child: const Icon(Icons.notifications, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextField(
              decoration: InputDecoration(
                icon: const Icon(Icons.search),
                hintText: "Search for services...",
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🚨 Emergency Card
  Widget _emergencyCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: const Color(0xffFFEDED),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.warning, color: Colors.white),
            ),
            SizedBox(width: 15.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Emergency Services",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "24/7 Priority Response",
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.red),
          ],
        ),
      ),
    );
  }

  /// 📊 Stats Row
  Widget _statsRow() {
    return SizedBox(
      height: 110.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            _statCard("4.8", "Avg Rating", Icons.star),
            SizedBox(width: 12.w),
            _statCard("30 min", "Avg Response", Icons.access_time),
            SizedBox(width: 12.w),
            _statCard("250+", "Services", Icons.build),
            SizedBox(width: 12.w),
            _statCard("99%", "Satisfaction", Icons.thumb_up),
            SizedBox(width: 12.w),
            _statCard("99%", "Satisfaction", Icons.thumb_up),
            SizedBox(width: 12.w),
            _statCard("99%", "Satisfaction", Icons.thumb_up),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String subtitle, IconData icon) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.orange),
          SizedBox(height: 6.h),
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

  /// 🛠 All Services
  Widget _allServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All Services",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15.h),
        Wrap(
          spacing: 15.w,
          runSpacing: 12.h,
          alignment: WrapAlignment.spaceBetween,
          children: [
            _serviceItem(Icons.flash_on, "Electrician", Colors.orange),
            _serviceItem(Icons.plumbing, "Plumber", Colors.blue),
            _serviceItem(Icons.ac_unit, "AC Service", Colors.cyan),
            _serviceItem(Icons.ac_unit, "AC Service", Colors.cyan),
            _serviceItem(Icons.ac_unit, "AC Service", Colors.cyan),
            _serviceItem(Icons.ac_unit, "AC Service", Colors.cyan),
            _serviceItem(Icons.ac_unit, "AC Service", Colors.cyan),
            _serviceItem(Icons.ac_unit, "AC Service", Colors.cyan),
            _serviceItem(Icons.ac_unit, "AC Service", Colors.cyan),
          ],
        ),
      ],
    );
  }

  Widget _serviceItem(IconData icon, String title, Color color) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ServiceDetailScreen());
      },
      child: Container(
        width: 100.w,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(height: 10.h),
            Text(
              title,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
