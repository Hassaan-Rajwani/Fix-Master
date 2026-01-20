import 'package:fix_master/controllers/customer/home/booking_stepper_controller.dart';
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

          /// Date
          Text(
            "Choose Date",
            style: TextStyle(color: Colors.grey, fontSize: 13.sp),
          ),
          SizedBox(height: 12.h),
          _dateSelector(),

          SizedBox(height: 25.h),

          /// Time
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

  Widget _dateSelector() {
    return Obx(
      () => DatePicker(
        DateTime.now(),
        height: 85.h,
        width: 70.w,
        initialSelectedDate: controller.selectedDate.value,
        selectionColor: const Color(0xff4285F4),
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
      spacing: 6.w,
      runSpacing: 6.h,
      children: List.generate(times.length, (index) {
        return Obx(
          () => GestureDetector(
            onTap: () => controller.selectTime(index),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: controller.selectedTimeIndex.value == index
                    ? const Color(0xff4285F4)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: controller.selectedTimeIndex.value == index
                      ? const Color(0xff4285F4)
                      : Colors.grey.shade300,
                ),
              ),
              child: Text(
                times[index],
                style: TextStyle(
                  color: controller.selectedTimeIndex.value == index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
