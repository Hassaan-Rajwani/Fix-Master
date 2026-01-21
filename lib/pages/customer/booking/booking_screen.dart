// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/customer/booking/booking_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fix_master/utils/color_constant.dart';

class BookingController extends GetxController {
  RxInt selectedTab = 0.obs;

  /// Dummy data for bookings
  final bookings = <Map<String, dynamic>>[
    {
      "title": "AC Servicing",
      "name": "John Smith",
      "date": "Jan 15, 2026",
      "time": "10:00 AM",
      "price": "\$85",
      "rating": "5",
      "status": "Completed",
      "statusColor": Colors.green,
      "type": 1, // Completed
    },
    {
      "title": "Pipe Leak Repair",
      "name": "Mike Johnson",
      "date": "Jan 12, 2026",
      "time": "2:00 PM",
      "price": "\$65",
      "rating": "4",
      "status": "Completed",
      "statusColor": Colors.green,
      "type": 1,
    },
    {
      "title": "Full Home Clean",
      "name": "Sarah Davis",
      "date": "Jan 18, 2026",
      "time": "9:00 AM",
      "price": "\$150",
      "rating": "",
      "status": "Upcoming",
      "statusColor": Colors.blue,
      "type": 0, // Upcoming
    },
    {
      "title": "Leak Fix",
      "name": "David Lee",
      "date": "Jan 20, 2026",
      "time": "11:00 AM",
      "price": "\$70",
      "rating": "",
      "status": "Cancelled",
      "statusColor": Colors.red,
      "type": 2, // Cancelled
    },
  ].obs;

  /// Get bookings for current tab
  List<Map<String, dynamic>> get filteredBookings {
    return bookings.where((b) => b["type"] == selectedTab.value).toList();
  }
}

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});

  final controller = Get.put(BookingController());
  final List<String> tabs = ["Upcoming", "Completed", "Cancelled"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80.h,
        title: Text(
          "My Bookings",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.verticalSpace,
            _tabs(),

            SizedBox(height: 15.h),

            /// Booking List
            Expanded(
              child: Obx(() {
                final bookings = controller.filteredBookings;
                if (bookings.isEmpty) {
                  return Center(
                    child: Text(
                      "No bookings yet",
                      style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                    ),
                  );
                }
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: bookings.length,
                  itemBuilder: (_, index) {
                    final b = bookings[index];
                    return _bookingCard(
                      title: b["title"],
                      name: b["name"],
                      date: b["date"],
                      time: b["time"],
                      price: b["price"],
                      rating: b["rating"],
                      status: b["status"],
                      statusColor: b["statusColor"],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔘 Tabs
  Widget _tabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Obx(() {
        return Row(
          children: List.generate(tabs.length, (index) {
            final isSelected = controller.selectedTab.value == index;
            return Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: GestureDetector(
                onTap: () => controller.selectedTab.value = index,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primaryColor : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: AppColor.primaryColor.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ]
                        : [],
                  ),
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      }),
    );
  }

  /// 📦 Booking Card
  Widget _bookingCard({
    required String title,
    required String name,
    required String date,
    required String time,
    required String price,
    required String rating,
    required String status,
    required Color statusColor,
  }) {
    return GestureDetector(
      onTap: () => Get.to(() => const BookingDetailScreen()),
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(18.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title + Status
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 6.h),

            Text(
              "by $name",
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
            ),

            SizedBox(height: 12.h),

            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 6.w),
                Text(date, style: TextStyle(fontSize: 12.sp)),
                SizedBox(width: 20.w),
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 6.w),
                Text(time, style: TextStyle(fontSize: 12.sp)),
              ],
            ),

            Divider(height: 30.h, color: Colors.grey.shade200),

            /// Price + Rating + View Details
            Row(
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
                if (rating.isNotEmpty) ...[
                  SizedBox(width: 15.w),
                  const Icon(Icons.star, color: Colors.orange, size: 18),
                  SizedBox(width: 4.w),
                  Text(rating, style: TextStyle(fontSize: 13.sp)),
                ],
                const Spacer(),
                Text(
                  "View Details  >",
                  style: TextStyle(
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
