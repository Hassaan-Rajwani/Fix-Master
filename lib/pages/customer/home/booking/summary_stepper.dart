// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';
import 'package:fix_master/utils/color_constant.dart';

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
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 18.h),

          /// 🔹 Service Summary Card
          _summaryCard(),

          SizedBox(height: 20.h),

          /// 🔹 Price Details Card
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Service Row
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.electrical_services,
                  color: AppColor.primaryColor,
                  size: 22.sp,
                ),
              ),
              SizedBox(width: 14.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "New Wiring",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Electrician",
                    style: TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 20.h),
          Divider(height: 1, color: Colors.grey[300]),

          SizedBox(height: 12.h),
          _infoRow(
            Icons.calendar_month,
            "${controller.selectedDate.value.day} "
            "${_monthName(controller.selectedDate.value.month)}, "
            "${controller.selectedDate.value.year}",
          ),
          SizedBox(height: 10.h),
          _infoRow(Icons.access_time, "10:00 AM • 2-3 hrs"),
          SizedBox(height: 10.h),
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

          SizedBox(height: 12.h),
          Divider(height: 1, color: Colors.grey[300]),
          SizedBox(height: 12.h),

          _priceRow("Total", 75, isTotal: true),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18.sp, color: Colors.grey[600]),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13.sp, color: Colors.grey[800]),
          ),
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
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? AppColor.primaryColor : Colors.black,
            ),
          ),
          Text(
            "${amount < 0 ? "-" : ""}\$${amount.abs()}",
            style: TextStyle(
              fontSize: isTotal ? 16.sp : 13.sp,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isDiscount
                  ? Colors.green
                  : isTotal
                  ? AppColor.primaryColor
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          offset: const Offset(0, 6),
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
