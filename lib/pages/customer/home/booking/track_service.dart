// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:fix_master/pages/customer/home/booking/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrackServiceScreen extends StatefulWidget {
  const TrackServiceScreen({super.key});

  @override
  State<TrackServiceScreen> createState() => _TrackServiceScreenState();
}

class _TrackServiceScreenState extends State<TrackServiceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  int countdown = 12; // example countdown in minutes

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // countdown simulation
    Timer.periodic(const Duration(seconds: 60), (timer) {
      if (countdown > 0) {
        setState(() => countdown--);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// 🗺 Map Placeholder with gradient overlay
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(color: Colors.blue.withOpacity(0.08)),
                  const Icon(
                    Icons.navigation,
                    size: 40,
                    color: Color(0xff4285F4),
                  ),
                  Positioned(
                    bottom: 40.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.local_shipping,
                            color: Color(0xff4285F4),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "Provider is $countdown min away",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Bottom Sheet Content
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Arriving Card with pulse
                  ScaleTransition(
                    scale: _pulseAnimation,
                    child: _arrivalCard(),
                  ),

                  SizedBox(height: 16.h),

                  /// Provider Card
                  _providerCard(),

                  SizedBox(height: 20.h),

                  /// Complete Button
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const ServiceCompletedScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4285F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        "Complete & Rate",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ⏱ Arrival Info Card
  Widget _arrivalCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Arriving in",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                ),
                SizedBox(height: 4.h),
                Text(
                  "$countdown min",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4285F4),
                  ),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: Colors.blue.withOpacity(0.1),
            child: const Icon(Icons.person, color: Color(0xff4285F4)),
          ),
        ],
      ),
    );
  }

  /// 👨‍🔧 Provider Card
  Widget _providerCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          /// Name Row
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.person),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Smith",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        SizedBox(width: 4.w),
                        Text(
                          "4.9 • 523 jobs",
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.call, color: Color(0xff4285F4)),
              SizedBox(width: 12.w),
              Icon(Icons.chat, color: Color(0xff4285F4)),
            ],
          ),

          SizedBox(height: 16.h),

          /// Status Timeline with vertical progress indicator
          Column(
            children: [
              _statusRow("Booking confirmed", true, "10:00 AM"),
              _statusRow("Provider assigned", true, "10:05 AM"),
              _statusRow("On the way", true, "10:15 AM"),
              _statusRow("Arrived", false, ""),
              _statusRow("Job completed", false, ""),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusRow(String title, bool done, String time) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 10,
            color: done ? Colors.green : Colors.grey.shade300,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(title, style: TextStyle(fontSize: 13.sp)),
          ),
          if (time.isNotEmpty)
            Text(
              time,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}
