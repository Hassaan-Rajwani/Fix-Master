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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80.h,
        leading: GestureDetector(
          onTap: () {
            controller.previousStep();
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("New Wiring", style: TextStyle(color: Colors.black)),
      ),
      body: Column(
        children: [
          _stepIndicator(),
          Expanded(
            child: Obx(() {
              switch (controller.currentStep.value) {
                case 0:
                  return DateTimeStep();
                case 1:
                  return ServiceLocationStep();
                case 2:
                  return BookingSummaryStep();
                case 3:
                  return PaymentMethodStep();
                default:
                  return const SizedBox();
              }
            }),
          ),
          _bottomButton(),
        ],
      ),
    );
  }

  /// 🔵 Step Indicator
  Widget _stepIndicator() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: List.generate(4, (index) {
          return Expanded(
            child: Obx(
              () => Container(
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 4.h,
                decoration: BoxDecoration(
                  color: controller.currentStep.value >= index
                      ? const Color(0xff4285F4)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  /// 🔘 Bottom Button
  Widget _bottomButton() {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
          onPressed: controller.nextStep,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff4285F4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Obx(
            () => Text(
              controller.currentStep.value == 1
                  ? "Confirm Location"
                  : controller.currentStep.value == 2
                  ? "Proceed to Pay"
                  : controller.currentStep.value == 3
                  ? "Pay \$80"
                  : "Continue",
            ),
          ),
        ),
      ),
    );
  }
}
