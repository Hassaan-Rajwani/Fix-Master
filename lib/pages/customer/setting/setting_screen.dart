// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/auth/login_screen.dart';
import 'package:fix_master/pages/customer/setting/payment_method.dart';
import 'package:fix_master/pages/customer/setting/saved_address.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  const SettingScreen({
    super.key,
    this.user = const {
      "name": "Alex Johnson",
      "email": "alex.johnson@email.com",
      "rating": 4.9,
      "wallet": 125.0,
      "addresses": 3,
      "cards": 2,
      "notifications": true,
      "offers": 5,
    },
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: Column(
        children: [
          _topProfileHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  _walletCard(),
                  SizedBox(height: 20.h),
                  _menuCard(),
                  SizedBox(height: 150.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔵 Profile Header
  Widget _topProfileHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
      decoration: const BoxDecoration(
        color: Color(0xff4285F4),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 32,
                  color: const Color(0xff4285F4),
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user["name"],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(user["email"], style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4.w),
                      Text(
                        "${user["rating"]} Customer Rating",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 💳 Wallet Card
  Widget _walletCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Wallet Balance",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 6.h),
                Text(
                  "\$${user["wallet"].toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4285F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              ),
              child: const Text("Add Money"),
            ),
          ],
        ),
      ),
    );
  }

  /// 📋 Menu List
  Widget _menuCard() {
    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Icons.location_on,
        "title": "Saved Addresses",
        "subtitle": "${user["addresses"]} addresses",
        "action": () => Get.to(() => const SavedAddressesScreen()),
      },
      {
        "icon": Icons.credit_card,
        "title": "Payment Methods",
        "subtitle": "${user["cards"]} cards",
        "action": () => Get.to(() => const PaymentMethodsScreen()),
      },
      {
        "icon": Icons.notifications,
        "title": "Notifications",
        "subtitle": user["notifications"] ? "On" : "Off",
      },
      {
        "icon": Icons.card_giftcard,
        "title": "Rewards & Offers",
        "subtitle": "${user["offers"]} available",
      },
      {"icon": Icons.help_outline, "title": "Help & Support", "subtitle": ""},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          ...menuItems.map(
            (item) => _menuItem(
              item["icon"],
              item["title"],
              item["subtitle"],
              item["action"],
            ),
          ),
          const SizedBox(height: 24),

          /// SIGN OUT
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Get.offAll(() => LoginScreen());
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                "Sign Out",
                style: TextStyle(color: Colors.red),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFDECEC),
                elevation: 4,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                shadowColor: Colors.red.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(
    IconData icon,
    String title,
    String subtitle, [
    VoidCallback? onTap,
  ]) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffEEF3FF),
              child: Icon(icon, color: const Color(0xff4285F4)),
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
