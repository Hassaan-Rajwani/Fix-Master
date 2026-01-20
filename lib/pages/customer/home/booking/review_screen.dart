// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/customer/dashboard/customer_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceCompletedScreen extends StatefulWidget {
  const ServiceCompletedScreen({super.key});

  @override
  State<ServiceCompletedScreen> createState() => _ServiceCompletedScreenState();
}

class _ServiceCompletedScreenState extends State<ServiceCompletedScreen>
    with SingleTickerProviderStateMixin {
  int selectedRating = 0;
  int selectedTipIndex = -1;

  final List<String> tips = ["\$5", "\$10", "\$15", "Custom"];
  final TextEditingController reviewCtrl = TextEditingController();

  late AnimationController _starAnimController;

  @override
  void initState() {
    super.initState();
    _starAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 0.8,
      upperBound: 1.2,
    );
  }

  @override
  void dispose() {
    _starAnimController.dispose();
    reviewCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),

              /// ✅ Success Icon
              Container(
                height: 80.w,
                width: 80.w,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, size: 40, color: Colors.green),
              ),

              SizedBox(height: 20.h),

              /// Title
              Text(
                "Service Completed!",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 6.h),

              Text(
                "How was your experience?",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              ),

              SizedBox(height: 20.h),

              /// ⭐ Rating Stars
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  bool isFilled = index < selectedRating;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRating = index + 1;
                      });
                      _starAnimController.forward().then((_) {
                        _starAnimController.reverse();
                      });
                    },
                    child: ScaleTransition(
                      scale: _starAnimController,
                      child: Icon(
                        Icons.star,
                        size: 36,
                        color: isFilled ? Colors.orange : Colors.grey.shade300,
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 24.h),

              /// 👨‍🔧 Provider Card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.grey.shade200,
                      child: const Icon(Icons.person, size: 28),
                    ),
                    SizedBox(width: 14.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Smith",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "New Wiring",
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              /// 💰 Tip Section
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add a tip for John",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(height: 12.h),

              Wrap(
                spacing: 10.w,
                runSpacing: 10.h,
                children: List.generate(tips.length, (index) {
                  final bool isSelected = selectedTipIndex == index;
                  return ChoiceChip(
                    label: Text(tips[index]),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedTipIndex = index;
                      });
                    },
                    selectedColor: const Color(0xff4285F4),
                    backgroundColor: Colors.grey.shade100,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 16.w,
                    ),
                  );
                }),
              ),

              SizedBox(height: 20.h),

              /// 📝 Review Field
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: reviewCtrl,
                  maxLines: 4,
                  style: TextStyle(fontSize: 13.sp),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Write a review (optional)",
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                  ),
                ),
              ),

              const Spacer(),

              /// 🔵 Submit Button
              SizedBox(
                width: double.infinity,
                height: 52.h,
                child: ElevatedButton(
                  onPressed: selectedRating == 0
                      ? null
                      : () {
                          // Submit logic here
                          Get.offAll(() => const CustomerBottomNav());
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedRating == 0
                        ? Colors.grey.shade400
                        : const Color(0xff4285F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Submit Review",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
