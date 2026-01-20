// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// DOCUMENTS
                  const Text(
                    "Documents",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
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

                  const SizedBox(height: 24),

                  /// SERVICE AREAS
                  const Text(
                    "Service Areas",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _AreaChip("Downtown"),
                      _AreaChip("Midtown"),
                      _AreaChip("Upper East"),
                      _AreaChip("Brooklyn"),
                      _AreaChip("Queens"),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// ADD MORE AREAS
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add, size: 18),
                    label: const Text("Add More Areas"),
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xff3B6EEA),
                    ),
                  ),

                  const SizedBox(height: 24),

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
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
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
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
      decoration: const BoxDecoration(
        color: Color(0xff1BA94C),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 32, color: Colors.black),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "John Smith",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "AC Service Expert",
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 4),
              Row(
                children: [
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
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: statusColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
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
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
    );
  }
}
