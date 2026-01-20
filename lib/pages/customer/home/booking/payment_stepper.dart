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
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.h),

          Expanded(
            child: ListView.builder(
              itemCount: controller.paymentMethods.length,
              itemBuilder: (context, index) {
                final item = controller.paymentMethods[index];

                /// 🔑 EACH ITEM has its own Obx
                return Obx(() {
                  final isSelected =
                      controller.selectedPaymentIndex.value == index;

                  return GestureDetector(
                    onTap: () => controller.selectPaymentMethod(index),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(14.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xff4285F4)
                              : Colors.grey.shade300,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: (item["color"] as Color).withOpacity(0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              item["icon"] as IconData,
                              color: item["color"] as Color,
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
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  item["subtitle"].toString(),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          if (isSelected)
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xff4285F4),
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
