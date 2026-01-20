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
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Service Location",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 20.h),

          /// 🗺️ Map Placeholder
          Container(
            height: 140.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffEAF1FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 32,
                  color: Color(0xff4285F4),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Interactive Map",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h),

          /// 📍 Address List
          Column(
            children: List.generate(
              controller.addresses.length,
              (index) => _addressTile(index),
            ),
          ),

          SizedBox(height: 14.h),

          /// ➕ Add New Address
          GestureDetector(
            onTap: () => Get.to(() => AddNewAddressScreen()),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  "+ Add New Address",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🏠 Address Tile
  Widget _addressTile(int index) {
    return Obx(() {
      final isSelected = controller.selectedAddressIndex.value == index;
      final item = controller.addresses[index];

      return GestureDetector(
        onTap: () => controller.selectAddress(index),
        child: Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? const Color(0xff4285F4)
                  : Colors.grey.shade300,
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: isSelected
                    ? const Color(0xff4285F4)
                    : Colors.grey.shade200,
                child: Icon(
                  item["icon"] as IconData,
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["title"] as String,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      item["address"] as String,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                const Icon(Icons.check_circle, color: Color(0xff4285F4)),
            ],
          ),
        ),
      );
    });
  }
}
