import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class DateTimeStep extends StatelessWidget {
  DateTimeStep({super.key});

  final controller = Get.put(BookingStepperController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Date & Time",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),

          /// 📅 Date
          Text(
            "Choose Date",
            style: TextStyle(color: Colors.grey, fontSize: 13.sp),
          ),
          SizedBox(height: 12.h),
          _dateSelector(),

          SizedBox(height: 25.h),

          /// ⏰ Time
          Text(
            "Choose Time",
            style: TextStyle(color: Colors.grey, fontSize: 13.sp),
          ),
          SizedBox(height: 12.h),
          _timeSelector(),
        ],
      ),
    );
  }

  /// 📅 Date Selector
  Widget _dateSelector() {
    return Obx(
      () => DatePicker(
        DateTime.now(),
        height: 85.h,
        width: 70.w,
        initialSelectedDate: controller.selectedDate.value,
        selectionColor: AppColor.primaryColor,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        dayTextStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
        monthTextStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
        onDateChange: (date) {
          controller.selectDate(date);
        },
      ),
    );
  }

  /// ⏰ Time Selector
  Widget _timeSelector() {
    final times = [
      "9:00 AM",
      "10:00 AM",
      "11:00 AM",
      "2:00 PM",
      "3:00 PM",
      "4:00 PM",
    ];

    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(times.length, (index) {
        return Obx(() {
          final bool isSelected = controller.selectedTimeIndex.value == index;

          return GestureDetector(
            onTap: () => controller.selectTime(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
              decoration: BoxDecoration(
                color: isSelected ? AppColor.primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: isSelected
                      ? AppColor.primaryColor
                      : Colors.grey.shade300,
                ),
              ),
              child: Text(
                times[index],
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        });
      }),
    );
  }
}
