// ignore_for_file: deprecated_member_use

import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';
import 'package:fix_master/pages/customer/home/booking/date_time_step.dart';
import 'package:fix_master/pages/customer/home/booking/location_stepper.dart';
import 'package:fix_master/pages/customer/home/booking/payment_stepper.dart';
import 'package:fix_master/pages/customer/home/booking/summary_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BookingStepperScreen extends StatelessWidget {
  BookingStepperScreen({super.key});

  final controller = Get.put(BookingStepperController());

  final List<String> steps = ["Date & Time", "Location", "Summary", "Payment"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80.h,
        leading: GestureDetector(
          onTap: controller.previousStep,
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("New Wiring", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          _animatedStepper(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Obx(() {
                switch (controller.currentStep.value) {
                  case 0:
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: DateTimeStep(),
                      ),
                    );
                  case 1:
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: ServiceLocationStep(),
                      ),
                    );
                  case 2:
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: BookingSummaryStep(),
                      ),
                    );
                  case 3:
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: PaymentMethodStep(),
                      ),
                    );
                  default:
                    return const SizedBox();
                }
              }),
            ),
          ),
          _bottomButton(),
        ],
      ),
    );
  }

  /// 🔹 Animated Stepper with Circles & Labels
  Widget _animatedStepper() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: List.generate(steps.length * 2 - 1, (i) {
          if (i.isEven) {
            final stepIndex = i ~/ 2;
            return Obx(() {
              bool isActive = controller.currentStep.value >= stepIndex;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 30.w,
                height: 30.w,
                decoration: BoxDecoration(
                  color: isActive ? const Color(0xff4285F4) : Colors.white,
                  border: Border.all(
                    color: isActive
                        ? const Color(0xff4285F4)
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: const Color(0xff4285F4).withOpacity(0.4),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    "${stepIndex + 1}",
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
            });
          } else {
            return Obx(() {
              int leftStep = i ~/ 2;
              bool isFilled = controller.currentStep.value > leftStep;
              return Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 4.h,
                  color: isFilled
                      ? const Color(0xff4285F4)
                      : Colors.grey.shade300,
                ),
              );
            });
          }
        }),
      ),
    );
  }

  /// 🔹 Bottom Button with dynamic text & gradient
  Widget _bottomButton() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Obx(() {
        String btnText = "";
        switch (controller.currentStep.value) {
          case 0:
            btnText = "Confirm Date & Time";
            break;
          case 1:
            btnText = "Confirm Location";
            break;
          case 2:
            btnText = "Proceed to Payment";
            break;
          case 3:
            btnText = "Pay \$80";
            break;
          default:
            btnText = "Continue";
        }

        return SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: controller.nextStep,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff4285F4), Color(0xff5A9BFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: Text(
                  btnText,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
