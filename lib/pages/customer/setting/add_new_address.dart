// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';

class AddNewAddressScreen extends StatelessWidget {
  AddNewAddressScreen({super.key});

  final controller = Get.find<BookingStepperController>();

  final titleCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final noteCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF6F7FB),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Add New Address",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _inputField(
              label: "Address Title",
              hint: "Home / Office",
              controller: titleCtrl,
            ),
            SizedBox(height: 14.h),

            _inputField(
              label: "Full Address",
              hint: "Street, City, Zip code",
              controller: addressCtrl,
              maxLines: 3,
            ),
            SizedBox(height: 14.h),

            _inputField(
              label: "Note (Optional)",
              hint: "Landmark, instructions",
              controller: noteCtrl,
              maxLines: 2,
            ),
            SizedBox(height: 24.h),

            /// 🗺 Map placeholder
            Container(
              height: 160.h,
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
                    color: Color(0xff4285F4),
                    size: 32,
                  ),
                  SizedBox(height: 6.h),
                  const Text("Pick location from map"),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            /// Save Button
            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {
                  if (titleCtrl.text.isEmpty || addressCtrl.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please fill all required fields",
                      backgroundColor: Colors.red.shade100,
                    );
                    return;
                  }

                  controller.addresses.add({
                    "icon": Icons.home,
                    "title": titleCtrl.text,
                    "address": addressCtrl.text,
                  });

                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4285F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text("Save Address"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔤 Input Field
  Widget _inputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 6.h),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
