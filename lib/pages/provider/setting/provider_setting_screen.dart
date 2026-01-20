// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fix_master/pages/auth/login_screen.dart';

class ProviderSettingScreen extends StatelessWidget {
  const ProviderSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: Column(
        children: [
          _header(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// DOCUMENTS
                  const Text(
                    "Documents",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),
                  _documentTile(
                    icon: Icons.shield_outlined,
                    title: "ID Verification",
                    status: "Verified",
                    statusColor: Colors.green,
                  ),
                  _documentTile(
                    icon: Icons.description_outlined,
                    title: "Background Check",
                    status: "Verified",
                    statusColor: Colors.green,
                  ),
                  _documentTile(
                    icon: Icons.workspace_premium_outlined,
                    title: "Skill Certification",
                    status: "Pending",
                    statusColor: Colors.orange,
                  ),

                  SizedBox(height: 24.h),

                  /// SERVICE AREAS
                  const Text(
                    "Service Areas",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 8.w,
                    runSpacing: 8.h,
                    children: const [
                      _AreaChip("Downtown"),
                      _AreaChip("Midtown"),
                      _AreaChip("Upper East"),
                      _AreaChip("Brooklyn"),
                      _AreaChip("Queens"),
                    ],
                  ),

                  SizedBox(height: 8.h),

                  /// ADD MORE AREAS
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text("Add More Areas"),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff3B6EEA),
                    ),
                  ),

                  SizedBox(height: 24.h),

                  /// SETTINGS TILES
                  _settingTile(
                    icon: Icons.notifications_outlined,
                    title: "Notification Settings",
                    onTap: () {},
                  ),
                  _settingTile(
                    icon: Icons.help_outline,
                    title: "Help & Support",
                    onTap: () {},
                  ),

                  SizedBox(height: 24.h),

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
                  150.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// HEADER
  Widget _header() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 70.h, 16.w, 24.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xff1BA94C), Color(0xff14A44D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 32.sp, color: Colors.black),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "John Smith",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.h),
              const Text(
                "AC Service Expert",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 4.h),
              Row(
                children: const [
                  Icon(Icons.verified, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "Verified Provider",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// DOCUMENT TILE
  Widget _documentTile({
    required IconData icon,
    required String title,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: statusColor),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// SETTING TILE
  Widget _settingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
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
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}

class _AreaChip extends StatelessWidget {
  final String title;
  const _AreaChip(this.title);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(title),
      backgroundColor: const Color(0xffEAF2FF),
      labelStyle: const TextStyle(color: Color(0xff3B6EEA)),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    );
  }
}
