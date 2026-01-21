// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:fix_master/pages/customer/home/booking/booking_stepper_screen.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: Column(
        children: [
          _topHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ratingRow(),
                  25.verticalSpace,
                  _sectionTitle("Wiring"),
                  12.verticalSpace,
                  _serviceTile(
                    title: "New Wiring",
                    time: "2-3 hrs",
                    price: "\$80",
                  ),
                  _serviceTile(
                    title: "Rewiring",
                    time: "3-4 hrs",
                    price: "\$120",
                  ),
                  _serviceTile(
                    title: "Wire Repair",
                    time: "1 hr",
                    price: "\$50",
                  ),
                  25.verticalSpace,
                  _sectionTitle("Lighting"),
                  12.verticalSpace,
                  _serviceTile(
                    title: "Light Installation",
                    time: "1 hr",
                    price: "\$45",
                  ),
                  _serviceTile(
                    title: "Light Installation",
                    time: "1 hr",
                    price: "\$45",
                  ),
                  _serviceTile(
                    title: "Light Installation",
                    time: "1 hr",
                    price: "\$45",
                  ),
                  16.verticalSpace,
                  _successMessage(),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔵 Top Header
  Widget _topHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        16.w,
        Platform.isAndroid ? 50.h : 70.h,
        16.w,
        20.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primaryColor,
            AppColor.primaryColor.withOpacity(0.85),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26.r)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          10.horizontalSpace,
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.orange,
            child: const Icon(Icons.flash_on, color: Colors.white),
          ),
          12.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Electrician",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Electrical repairs & installations",
                style: TextStyle(color: Colors.white70, fontSize: 12.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ⭐ Rating Row
  Widget _ratingRow() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.orange, size: 20),
        4.horizontalSpace,
        Text(
          "4.8",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        4.horizontalSpace,
        Text(
          "(2.5k reviews)",
          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
        const Spacer(),
        const Icon(Icons.access_time, size: 18, color: Colors.grey),
        4.horizontalSpace,
        Text(
          "Avg. 45 min arrival",
          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
      ],
    );
  }

  /// 📌 Section Title
  Widget _sectionTitle(String title) {
    return Row(
      children: [
        Icon(Icons.handyman, size: 18, color: AppColor.primaryColor),
        6.horizontalSpace,
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
      ],
    );
  }

  /// 🧾 Service Tile
  Widget _serviceTile({
    required String title,
    required String time,
    required String price,
  }) {
    return GestureDetector(
      onTap: () => Get.to(() => BookingStepperScreen()),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.10),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.build, color: AppColor.primaryColor),
            ),
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.verticalSpace,
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey,
                      ),
                      4.horizontalSpace,
                      Text(
                        time,
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Starting",
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Success / Popular Message
  Widget _successMessage() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.emoji_events, color: Colors.green),
          12.horizontalSpace,
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Most Popular",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 4),
                Text("New Wiring is trending in your area"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
