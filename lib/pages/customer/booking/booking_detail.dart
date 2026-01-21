// ignore_for_file: deprecated_member_use

import 'package:fix_master/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingDetailScreen extends StatelessWidget {
  final Map<String, dynamic> booking;

  const BookingDetailScreen({
    super.key,
    this.booking = const {
      "title": "AC Servicing",
      "id": "#FM2024015",
      "status": "Completed",
      "statusType": 1,
      "serviceFee": "\$80",
      "tax": "\$5",
      "total": "\$85",
      "provider": "John Smith",
      "providerRating": "4.9",
      "providerJobs": 523,
      "date": "Jan 15, 2026",
      "time": "10:00 AM",
    },
  });

  @override
  Widget build(BuildContext context) {
    final status = booking["status"] as String;
    final statusType = booking["statusType"] as int;

    Color statusColor() {
      switch (statusType) {
        case 0:
          return AppColor.primaryColor; // Upcoming
        case 1:
          return Colors.green; // Completed
        case 2:
          return Colors.red; // Cancelled
        default:
          return Colors.grey;
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80.h,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColor.primaryColor),
        ),
        title: Text(
          "Booking Details",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Status Card
            _statusCard(status, statusColor()),

            SizedBox(height: 16.h),

            /// Service Info
            _infoCard(
              title: "Service Information",
              child: Column(
                children: [
                  _infoRow("Service", booking["title"]),
                  _infoRow("Booking ID", booking["id"]),
                  _infoRow("Status", status, valueColor: statusColor()),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            /// Provider Info
            _infoCard(
              title: "Service Provider",
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(Icons.person),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking["provider"],
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "${booking["providerRating"]} (${booking["providerJobs"]} jobs)",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            /// Date & Time
            _infoCard(
              title: "Schedule",
              child: Column(
                children: [
                  _infoRow("Date", booking["date"]),
                  _infoRow("Time", booking["time"]),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            /// Payment
            _infoCard(
              title: "Payment",
              child: Column(
                children: [
                  _infoRow("Service Fee", booking["serviceFee"]),
                  _infoRow("Tax", booking["tax"]),
                  Divider(color: Colors.grey.shade300),
                  _infoRow("Total", booking["total"], isBold: true),
                ],
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  /// 🔵 Status Card
  Widget _statusCard(String status, Color color) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(
              status == "Completed" ? Icons.check : Icons.info,
              color: color,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(status, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4.h),
              Text(
                "Thank you for using our service",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 📦 Common Info Card
  Widget _infoCard({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 12.h),
          child,
        ],
      ),
    );
  }

  Widget _infoRow(
    String title,
    String value, {
    bool isBold = false,
    Color? valueColor,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: Colors.grey)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: valueColor ?? AppColor.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
