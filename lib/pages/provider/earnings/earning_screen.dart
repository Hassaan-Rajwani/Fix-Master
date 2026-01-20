// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/provider/earnings/earning_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Earnings",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              _balanceCard(),
              SizedBox(height: 20.h),
              _statsRow(),
              SizedBox(height: 20.h),
              _transactionsHeader(),
              SizedBox(height: 12.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (_, index) {
                  return _transactionItem(
                    title: "AC Servicing",
                    name: "Emily Chen",
                    amount: "\$85",
                    time: "2:30 PM",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= BALANCE CARD =================
  Widget _balanceCard() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff14A44D), Color(0xff19C964)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.white,
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                "Available Balance",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          const Text(
            "\$1,245.80",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: const Text(
                    "Withdraw",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const EarningsHistoryPage());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: const Text(
                    "View History",
                    style: TextStyle(
                      color: Color(0xff14A44D),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ================= STATS =================
  Widget _statsRow() {
    return Row(
      children: [
        _statsCard(
          title: "This Week",
          amount: "\$2,485",
          subtitle: "32 jobs completed",
          active: true,
        ),
        SizedBox(width: 12.w),
        _statsCard(
          title: "This Month",
          amount: "\$8,240",
          subtitle: "124 jobs completed",
          active: true,
        ),
      ],
    );
  }

  Widget _statsCard({
    required String title,
    required String amount,
    required String subtitle,
    bool active = false,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: active ? const Color(0xff14A44D) : Colors.transparent,
            width: 1.2,
          ),
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
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 16,
                  color: active ? const Color(0xff14A44D) : Colors.grey,
                ),
                SizedBox(width: 6.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: active ? const Color(0xff14A44D) : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              amount,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // ================= TRANSACTIONS =================
  Widget _transactionsHeader() {
    return const Text(
      "Recent Transactions",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget _transactionItem({
    required String title,
    required String name,
    required String amount,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: const Color(0xff14A44D).withOpacity(0.15),
            child: const Icon(
              Icons.trending_up,
              color: Color(0xff14A44D),
              size: 20,
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
                style: const TextStyle(
                  color: Color(0xff14A44D),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
