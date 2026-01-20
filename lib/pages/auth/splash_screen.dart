// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/auth/login_screen.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeScale;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeScale = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    changeScreen();
  }

  changeScreen() async {
    // final isToken = await getDataFromStorage(StorageKeys.token);
    // Future.delayed(
    //   Duration(milliseconds: 1000),
    //   () async {
    //     await getDataFromStorage(StorageKeys.onboardingDone).then((
    //       value,
    //     ) async {
    //       if (value == 'true') {
    //         if (isToken != null) {
    //           GlobalVariable.jwtToken = isToken;
    //           await sc.autoLogin();
    //         } else {
    //           Get.offAll(() => const TypeOfAcc());
    //         }
    //       } else {
    //         Get.offAll(() => const OnboardingScreen());
    //       }
    //     });
    //   },
    // );

    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAll(() => const LoginScreen());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColor.primaryColor, Color(0xFF0F4C81)],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeScale,
            child: ScaleTransition(
              scale: _fadeScale,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/svgs/appIcon.svg', width: 140.w),
                  SizedBox(height: 20.h),
                  Text(
                    'Fix Master',
                    style: appFont(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    'Professional Home Services',
                    style: appFont(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
