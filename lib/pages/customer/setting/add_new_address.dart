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
            SizedBox(height: 16.h),

            _inputField(
              label: "Full Address",
              hint: "Street, City, Zip code",
              controller: addressCtrl,
              maxLines: 3,
            ),
            SizedBox(height: 16.h),

            _inputField(
              label: "Note (Optional)",
              hint: "Landmark, instructions",
              controller: noteCtrl,
              maxLines: 2,
            ),
            SizedBox(height: 24.h),

            /// 🗺 Map Card
            Container(
              height: 160.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffEAF1FF), Color(0xffD4E2FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xff4285F4),
                      size: 32,
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Pick location from map",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30.h),

            /// 💾 Save Button
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
                      colorText: Colors.red.shade800,
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
                  shadowColor: Colors.black26,
                  elevation: 5,
                ),
                child: Text(
                  "Save Address",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔤 Enhanced Input Field
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
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xff4285F4),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
