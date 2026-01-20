// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: const Color(0xff19A74A),
        elevation: 0,
        title: const Text("Job Details"),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _jobHeader(),
            SizedBox(height: 16.h),
            _infoCard(),
            SizedBox(height: 16.h),
            _customerCard(),
          ],
        ),
      ),
    );
  }

  // ================= JOB HEADER =================
  Widget _jobHeader() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xff4F7CFE).withOpacity(0.1),
            child: const Icon(
              Icons.ac_unit,
              color: Color(0xff4F7CFE),
              size: 30,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Filter Cleaning",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Tomorrow • 10:00 AM",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= JOB INFO =================
  Widget _infoCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          _infoRow(Icons.location_on, "Address", "123 Oak Street, Apt 4B"),
          SizedBox(height: 10.h),
          _infoRow(Icons.attach_money, "Payment", "\$35"),
          SizedBox(height: 10.h),
          _infoRow(Icons.social_distance, "Distance", "1.8 km"),
          SizedBox(height: 10.h),
          _infoRow(
            Icons.notes,
            "Description",
            "AC filter cleaning and basic inspection.",
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= CUSTOMER INFO =================
  Widget _customerCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 24, child: Icon(Icons.person)),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Emily Chen",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Customer",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat, color: Color(0xff19A74A)),
          ),
        ],
      ),
    );
  }
}
