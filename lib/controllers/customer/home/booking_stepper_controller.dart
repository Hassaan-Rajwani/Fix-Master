import 'package:fix_master/pages/customer/home/booking/booking_confirm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingStepperController extends GetxController {
  var currentStep = 0.obs;

  /// Date & Time
  var selectedDate = DateTime.now().obs;
  var selectedTimeIndex = (-1).obs;

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectTime(int index) {
    selectedTimeIndex.value = index;
  }

  /// Step 2: Location
  var selectedAddressIndex = 0.obs;

  final addresses = [
    {
      "title": "Home",
      "address": "123 Oak Street, Apt 4B,\nDowntown",
      "icon": Icons.location_on,
    },
    {
      "title": "Office",
      "address": "456 Business Ave, Floor 12",
      "icon": Icons.location_on_outlined,
    },
  ];

  void selectAddress(int index) {
    selectedAddressIndex.value = index;
  }

  /// Step 4: Payment
  var selectedPaymentIndex = 0.obs;

  final paymentMethods = [
    {
      "title": "Credit/Debit Card",
      "subtitle": "**** **** **** 4242",
      "icon": Icons.credit_card,
      "color": Colors.deepPurple,
    },
    {
      "title": "FixMaster Wallet",
      "subtitle": "Balance: \$125.00",
      "icon": Icons.account_balance_wallet,
      "color": Colors.green,
    },
    {
      "title": "Cash on Service",
      "subtitle": "Pay after completion",
      "icon": Icons.attach_money,
      "color": Colors.orange,
    },
  ];

  void selectPaymentMethod(int index) {
    selectedPaymentIndex.value = index;
  }

  void nextStep() {
    if (currentStep.value < 3) {
      currentStep.value++;
    } else {
      Get.to(() => BookingConfirmedScreen());
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    } else {
      Get.back();
    }
  }
}
