// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';

class PaymentMethodStep extends StatelessWidget {
  PaymentMethodStep({super.key});

  final controller = Get.find<BookingStepperController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),

          Expanded(
            child: ListView.builder(
              itemCount: controller.paymentMethods.length,
              itemBuilder: (context, index) {
                final item = controller.paymentMethods[index];

                /// 🔑 EACH ITEM has its own Obx for selection
                return Obx(() {
                  final isSelected =
                      controller.selectedPaymentIndex.value == index;

                  return GestureDetector(
                    onTap: () => controller.selectPaymentMethod(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xff4285F4)
                              : Colors.grey.shade300,
                          width: isSelected ? 2 : 1.2,
                        ),
                        color: isSelected
                            ? (item["color"] as Color).withOpacity(0.1)
                            : Colors.white,
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: (item["color"] as Color).withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: (item["color"] as Color).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              item["icon"] as IconData,
                              color: item["color"] as Color,
                              size: 24.sp,
                            ),
                          ),
                          SizedBox(width: 14.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"].toString(),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  item["subtitle"].toString(),
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 300),
                            opacity: isSelected ? 1 : 0,
                            child: const Icon(
                              Icons.check_circle,
                              color: Color(0xff4285F4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
