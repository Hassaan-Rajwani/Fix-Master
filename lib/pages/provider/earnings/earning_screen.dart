// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EarningsPage extends StatelessWidget {
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Earnings",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.h),
              _balanceCard(),
              SizedBox(height: 20.h),
              _statsRow(),
              SizedBox(height: 20.h),
              _transactionsHeader(),
              SizedBox(height: 12.h),
              _transactionItem(
                title: "AC Servicing",
                name: "Emily Chen",
                amount: "\$85",
                time: "2:30 PM",
              ),
              SizedBox(height: 10.h),
              _transactionItem(
                title: "Gas Refill",
                name: "David Park",
                amount: "\$120",
                time: "11:00 AM",
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
        color: const Color(0xff14A44D),
        borderRadius: BorderRadius.circular(20.r),
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
              fontSize: 26,
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
                  ),
                  child: const Text("Withdraw"),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: const Text(
                    "View History",
                    style: TextStyle(color: Color(0xff14A44D)),
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
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 14,
                  color: active ? const Color(0xff14A44D) : Colors.grey,
                ),
                SizedBox(width: 4.w),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    color: active ? const Color(0xff14A44D) : Colors.grey,
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
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // ================= TRANSACTIONS =================
  Widget _transactionsHeader() {
    return Text(
      "Recent Transactions",
      style: TextStyle(fontWeight: FontWeight.bold),
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
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: const Color(0xff14A44D).withOpacity(0.1),
            child: const Icon(
              Icons.trending_up,
              color: Color(0xff14A44D),
              size: 18,
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
