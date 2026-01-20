// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Text(
                "My Bookings",
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold),
              ),
            ),

            _tabs(),

            SizedBox(height: 10.h),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  _bookingCard(
                    title: "AC Servicing",
                    name: "John Smith",
                    date: "Jan 15, 2026",
                    time: "10:00 AM",
                    price: "\$85",
                    rating: "5",
                    status: "Completed",
                    statusColor: Colors.green,
                  ),
                  _bookingCard(
                    title: "Pipe Leak Repair",
                    name: "Mike Johnson",
                    date: "Jan 12, 2026",
                    time: "2:00 PM",
                    price: "\$65",
                    rating: "4",
                    status: "Completed",
                    statusColor: Colors.green,
                  ),
                  _bookingCard(
                    title: "Full Home Clean",
                    name: "Sarah Davis",
                    date: "Jan 18, 2026",
                    time: "9:00 AM",
                    price: "\$150",
                    rating: "",
                    status: "Upcoming",
                    statusColor: Colors.blue,
                  ),
                  _bookingCard(
                    title: "Full Home Clean",
                    name: "Sarah Davis",
                    date: "Jan 18, 2026",
                    time: "9:00 AM",
                    price: "\$150",
                    rating: "",
                    status: "Upcoming",
                    statusColor: Colors.blue,
                  ),
                  _bookingCard(
                    title: "Full Home Clean",
                    name: "Sarah Davis",
                    date: "Jan 18, 2026",
                    time: "9:00 AM",
                    price: "\$150",
                    rating: "",
                    status: "Upcoming",
                    statusColor: Colors.blue,
                  ),
                  _bookingCard(
                    title: "Full Home Clean",
                    name: "Sarah Davis",
                    date: "Jan 18, 2026",
                    time: "9:00 AM",
                    price: "\$150",
                    rating: "",
                    status: "Upcoming",
                    statusColor: Colors.blue,
                  ),
                  _bookingCard(
                    title: "Full Home Clean",
                    name: "Sarah Davis",
                    date: "Jan 18, 2026",
                    time: "9:00 AM",
                    price: "\$150",
                    rating: "",
                    status: "Upcoming",
                    statusColor: Colors.blue,
                  ),
                  _bookingCard(
                    title: "Full Home Clean",
                    name: "Sarah Davis",
                    date: "Jan 18, 2026",
                    time: "9:00 AM",
                    price: "\$150",
                    rating: "",
                    status: "Upcoming",
                    statusColor: Colors.blue,
                  ),
                ],
              ),
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
      child: Row(
        children: [
          _tabItem("Upcoming", 0),
          _tabItem("Completed", 1),
          _tabItem("Cancelled", 2),
        ],
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    bool isSelected = selectedTab == index;
    return Padding(
      padding: EdgeInsets.only(right: 10.w),
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xff4285F4) : Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
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
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title + Status
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
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

          Text("by $name", style: TextStyle(color: Colors.grey)),

          SizedBox(height: 12.h),

          Row(
            children: [
              Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              SizedBox(width: 6.w),
              Text(date),
              SizedBox(width: 20.w),
              Icon(Icons.access_time, size: 16, color: Colors.grey),
              SizedBox(width: 6.w),
              Text(time),
            ],
          ),

          Divider(height: 30.h),

          /// Price + Rating + View Details
          Row(
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xff4285F4),
                ),
              ),
              if (rating.isNotEmpty) ...[
                SizedBox(width: 15.w),
                const Icon(Icons.star, color: Colors.orange, size: 18),
                SizedBox(width: 4.w),
                Text(rating),
              ],
              const Spacer(),
              Text(
                "View Details  >",
                style: TextStyle(
                  color: const Color(0xff4285F4),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
