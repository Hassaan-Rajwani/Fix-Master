// ignore_for_file: deprecated_member_use

import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';
import 'package:fix_master/pages/customer/setting/add_new_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceLocationStep extends StatelessWidget {
  ServiceLocationStep({super.key});

  final controller = Get.find<BookingStepperController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Service Location",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),

            /// 🗺️ Interactive Map Placeholder
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffEAF1FF), Color(0xffD4E2FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 36,
                    color: Color(0xff4285F4),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Interactive Map",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            /// 📍 Address List
            Column(
              children: List.generate(
                controller.addresses.length,
                (index) => _addressTile(index),
              ),
            ),

            SizedBox(height: 14.h),

            /// ➕ Add New Address Button
            GestureDetector(
              onTap: () => Get.to(() => AddNewAddressScreen()),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade400),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "+ Add New Address",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🏠 Address Tile with animated selection
  Widget _addressTile(int index) {
    return Obx(() {
      final isSelected = controller.selectedAddressIndex.value == index;
      final item = controller.addresses[index];

      return GestureDetector(
        onTap: () => controller.selectAddress(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected
                  ? const Color(0xff4285F4)
                  : Colors.grey.shade300,
              width: isSelected ? 1.5 : 1.0,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xff4285F4).withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: isSelected
                    ? const Color(0xff4285F4)
                    : Colors.grey.shade200,
                child: Icon(
                  item["icon"] as IconData,
                  color: isSelected ? Colors.white : Colors.grey,
                  size: 20,
                ),
              ),
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"] as String,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.black : Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      item["address"] as String,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: isSelected ? 1 : 0,
                child: const Icon(Icons.check_circle, color: Color(0xff4285F4)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
