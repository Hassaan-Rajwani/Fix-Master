import 'package:fix_master/pages/customer/home/booking/booking_stepper_screen.dart';
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
                  SizedBox(height: 25.h),
                  _sectionTitle("Wiring"),
                  SizedBox(height: 12.h),
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
                  SizedBox(height: 25.h),
                  _sectionTitle("Lighting"),
                  SizedBox(height: 12.h),
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
      padding: EdgeInsets.fromLTRB(16.w, 55.h, 16.w, 20.h),
      decoration: const BoxDecoration(
        color: Color(0xff4285F4),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              SizedBox(width: 10.w),
              CircleAvatar(
                radius: 22,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.flash_on, color: Colors.white),
              ),
              SizedBox(width: 12.w),
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
        ],
      ),
    );
  }

  /// ⭐ Rating Row
  Widget _ratingRow() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.orange, size: 20),
        SizedBox(width: 4.w),
        Text(
          "4.8",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
        SizedBox(width: 4.w),
        Text(
          "(2.5k reviews)",
          style: TextStyle(color: Colors.grey, fontSize: 12.sp),
        ),
        const Spacer(),
        const Icon(Icons.access_time, size: 18, color: Colors.grey),
        SizedBox(width: 4.w),
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
        const Icon(Icons.handyman, size: 18),
        SizedBox(width: 6.w),
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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
      onTap: () {
        Get.to(() => BookingStepperScreen());
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: const Color(0xffEAF0FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.build, color: Color(0xff4285F4)),
            ),
            SizedBox(width: 12.w),
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
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4.w),
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
                    color: const Color(0xff4285F4),
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

  Widget _successMessage() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffE6F4EA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: const [
          Icon(Icons.emoji_events, color: Colors.green),
          SizedBox(width: 12),
          Expanded(
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
