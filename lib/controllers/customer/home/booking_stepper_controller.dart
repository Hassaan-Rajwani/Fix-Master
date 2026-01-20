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

  void nextStep() {
    currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    } else {
      Get.back();
    }
  }
}
