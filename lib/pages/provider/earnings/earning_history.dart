// ignore_for_file: deprecated_member_use

import 'package:fix_master/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EarningsHistoryPage extends StatefulWidget {
  const EarningsHistoryPage({super.key});

  @override
  State<EarningsHistoryPage> createState() => _EarningsHistoryPageState();
}

class _EarningsHistoryPageState extends State<EarningsHistoryPage> {
  String selectedFilter = "All";

  final List<Map<String, dynamic>> allHistory = [
    {
      "title": "AC Servicing",
      "name": "Emily Chen",
      "amount": "\$85",
      "dateText": "Today • 2:30 PM",
      "date": DateTime.now(),
    },
    {
      "title": "Gas Refill",
      "name": "David Park",
      "amount": "\$120",
      "dateText": "Today • 11:00 AM",
      "date": DateTime.now(),
    },
    {
      "title": "Filter Cleaning",
      "name": "Sophia Lee",
      "amount": "\$35",
      "dateText": "Yesterday • 4:15 PM",
      "date": DateTime.now().subtract(const Duration(days: 1)),
    },
    {
      "title": "AC Installation",
      "name": "Michael Brown",
      "amount": "\$250",
      "dateText": "12 Jan • 1:00 PM",
      "date": DateTime.now().subtract(const Duration(days: 20)),
    },
  ];

  List<Map<String, dynamic>> get filteredHistory {
    if (selectedFilter == "Week") {
      return allHistory.where((item) {
        return item["date"].isAfter(
          DateTime.now().subtract(const Duration(days: 7)),
        );
      }).toList();
    }

    if (selectedFilter == "Month") {
      return allHistory.where((item) {
        return item["date"].isAfter(
          DateTime.now().subtract(const Duration(days: 30)),
        );
      }).toList();
    }

    return allHistory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80.h,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(Icons.arrow_back, color: AppColor.primaryColor2),
        ),
        title: Text(
          "Earnings History",
          style: TextStyle(
            color: AppColor.primaryColor2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _filterRow(),
            SizedBox(height: 16.h),
            Expanded(
              child: filteredHistory.isEmpty
                  ? const Center(
                      child: Text(
                        "No records found",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredHistory.length,
                      itemBuilder: (context, index) {
                        final item = filteredHistory[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: _historyItem(
                            title: item["title"],
                            name: item["name"],
                            amount: item["amount"],
                            date: item["dateText"],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= FILTER CHIPS =================
  Widget _filterRow() {
    return Row(
      children: [
        _filterChip("All"),
        SizedBox(width: 8.w),
        _filterChip("Week"),
        SizedBox(width: 8.w),
        _filterChip("Month"),
      ],
    );
  }

  Widget _filterChip(String title) {
    final bool isActive = selectedFilter == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = title;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isActive ? AppColor.primaryColor2 : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isActive ? AppColor.primaryColor2 : Colors.grey.shade300,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  // ================= HISTORY ITEM =================
  Widget _historyItem({
    required String title,
    required String name,
    required String amount,
    required String date,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColor.primaryColor2.withOpacity(0.15),
            child: const Icon(
              Icons.attach_money,
              color: AppColor.primaryColor2,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  name,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryColor2,
                  fontSize: 14,
                ),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
