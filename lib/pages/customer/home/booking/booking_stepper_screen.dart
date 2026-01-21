// ignore_for_file: deprecated_member_use

import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';
import 'package:fix_master/pages/customer/home/booking/date_time_step.dart';
import 'package:fix_master/pages/customer/home/booking/location_stepper.dart';
import 'package:fix_master/pages/customer/home/booking/payment_stepper.dart';
import 'package:fix_master/pages/customer/home/booking/summary_stepper.dart';
import 'package:fix_master/utils/color_constant.dart';
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
          child: Icon(Icons.arrow_back, color: AppColor.primaryColor),
        ),
        title: Text(
          "New Wiring",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
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
                    return _stepCard(DateTimeStep());
                  case 1:
                    return _stepCard(ServiceLocationStep());
                  case 2:
                    return _stepCard(BookingSummaryStep());
                  case 3:
                    return _stepCard(PaymentMethodStep());
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

  /// 🔹 Reusable Step Card
  Widget _stepCard(Widget child) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(padding: EdgeInsets.all(16.w), child: child),
    );
  }

  /// 🔹 Animated Stepper
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
                  color: isActive ? AppColor.primaryColor : Colors.white,
                  border: Border.all(
                    color: isActive
                        ? AppColor.primaryColor
                        : Colors.grey.shade300,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: AppColor.primaryColor.withOpacity(0.35),
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
                      ? AppColor.primaryColor
                      : Colors.grey.shade300,
                ),
              );
            });
          }
        }),
      ),
    );
  }

  /// 🔹 Bottom Action Button
  Widget _bottomButton() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Obx(() {
        String btnText;
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
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.primaryColor,
                    AppColor.primaryColor.withOpacity(0.85),
                  ],
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
