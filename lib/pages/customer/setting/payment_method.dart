// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/customer/home/booking/payment_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookingStepperController());

    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF6F7FB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Payment Methods",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: PaymentMethodStep(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(bottom: 30),
        child: SizedBox(
          height: 52.h,
          child: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff4285F4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Save"),
          ),
        ),
      ),
    );
  }
}
