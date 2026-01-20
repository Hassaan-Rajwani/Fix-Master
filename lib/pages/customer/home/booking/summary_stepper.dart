// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';

class BookingSummaryStep extends StatelessWidget {
  BookingSummaryStep({super.key});

  final controller = Get.find<BookingStepperController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Booking Summary",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),

          /// 🔹 Service Summary Card
          _summaryCard(),

          SizedBox(height: 16.h),

          /// 🔹 Price Details
          _priceDetailsCard(),
        ],
      ),
    );
  }

  Widget _summaryCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          /// Service
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.electrical_services,
                  color: Colors.blue,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Wiring",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Electrician",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          Divider(height: 30.h),

          /// Date
          _infoRow(
            Icons.calendar_month,
            "${controller.selectedDate.value.day} "
            "${_monthName(controller.selectedDate.value.month)}, "
            "${controller.selectedDate.value.year}",
          ),

          SizedBox(height: 10.h),

          /// Time
          _infoRow(Icons.access_time, "10:00 AM • 2-3 hrs"),

          SizedBox(height: 10.h),

          /// Location
          Obx(() {
            final address =
                controller.addresses[controller.selectedAddressIndex.value];
            return _infoRow(Icons.location_on, address["address"].toString());
          }),
        ],
      ),
    );
  }

  Widget _priceDetailsCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          _priceRow("Service Charge", 80),
          _priceRow("Platform Fee", 5),
          _priceRow("Discount (WELCOME20)", -10, isDiscount: true),

          Divider(height: 30.h),

          _priceRow("Total", 75, isTotal: true),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: Colors.grey),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 13.sp)),
        ),
      ],
    );
  }

  Widget _priceRow(
    String title,
    int amount, {
    bool isTotal = false,
    bool isDiscount = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTotal ? 15.sp : 13.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            "${amount < 0 ? "-" : ""}\$${amount.abs()}",
            style: TextStyle(
              fontSize: isTotal ? 16.sp : 13.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isDiscount ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }
}
