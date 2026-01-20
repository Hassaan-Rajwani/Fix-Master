// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F6FA),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Performance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              _performanceScoreCard(),
              SizedBox(height: 16.h),
              _statsGrid(),
              SizedBox(height: 24.h),
              const Text(
                "Recent Reviews",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12.h),
              _reviewTile(
                "Emily C.",
                "Excellent service! Very professional and quick.",
                2,
                5,
              ),
              _reviewTile(
                "David P.",
                "Great job on the AC. Works perfectly now.",
                3,
                4,
              ),
              _reviewTile("Lisa W.", "Good service, arrived on time.", 5, 5),
              SizedBox(height: 16.h),
              _successMessage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _performanceScoreCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: const LinearGradient(
          colors: [Color(0xff4C8BF5), Color(0xff3B6EEA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.workspace_premium, color: Colors.white, size: 36),
          SizedBox(height: 8.h),
          const Text(
            "Performance Score",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 8.h),
          const Text(
            "96",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          const Text(
            "+3 from last month",
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _statsGrid() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.w,
      mainAxisSpacing: 12.h,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _StatCard("4.9", "Rating", Icons.star, Colors.orange),
        _StatCard(
          "94%",
          "Acceptance\nLast 30 days",
          Icons.thumb_up,
          Colors.green,
        ),
        _StatCard("98%", "On-Time\nPunctuality", Icons.schedule, Colors.blue),
        _StatCard(
          "99%",
          "Completion\nJob success",
          Icons.check_circle,
          Colors.teal,
        ),
      ],
    );
  }

  Widget _reviewTile(String name, String review, int daysAgo, int stars) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Text(name[0]),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Row(
                      children: List.generate(
                        stars,
                        (index) => const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(review, style: const TextStyle(fontSize: 13)),
                SizedBox(height: 4.h),
                Text(
                  "$daysAgo days ago",
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _successMessage() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xffE6F4EA),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.emoji_events, color: Colors.green),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Great Job!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  "You're in the top 5% of providers this month.\nKeep up the excellent work!",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const _StatCard(this.value, this.label, this.icon, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
    );
  }
}
