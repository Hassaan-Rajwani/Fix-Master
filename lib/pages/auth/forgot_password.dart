// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/auth/verify_email.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';
import 'package:fix_master/widgets/app_button.dart';
import 'package:fix_master/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 Header / Hero Section
            Container(
              width: double.infinity,
              height: 180.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.primaryColor,
                    AppColor.primaryColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.r),
                  bottomRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forgot Password',
                    style: appFont(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Enter your email to receive 4-digit OTP',
                    style: appFont(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 Card Section
            Transform.translate(
              offset: Offset(0, -30),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    AppInput(
                      label: 'Email Address',
                      placeHolder: 'Enter your email',
                      horizontalMargin: 0,
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),

                    25.verticalSpace,

                    AppButton(
                      text: 'Send OTP',
                      horizontalMargin: 0,
                      onPress: () {
                        Get.to(
                          () => VerifyEmailScreen(
                            isFromSignup: false,
                            email: 'test@yopmail.com',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
