// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/auth/forgot_password.dart';
import 'package:fix_master/pages/auth/signup_screen.dart';
import 'package:fix_master/pages/customer/dashboard/customer_bottom_nav.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';
import 'package:fix_master/widgets/app_button.dart';
import 'package:fix_master/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 Header / Hero Section
            Container(
              width: double.infinity,
              height: 220.h,
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
                    'Welcome Back 👋',
                    style: appFont(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Login to continue to Fix Master',
                    style: appFont(color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),

            /// 🔹 Login Card
            Transform.translate(
              offset: Offset(0, -40),
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
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    AppInput(
                      label: 'Password',
                      placeHolder: 'Enter your password',
                      horizontalMargin: 0,
                      showPasswordIcon: true,
                      prefixIcon: Icon(Icons.lock_outline),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Get.to(() => ForgotPasswordScreen()),
                        child: Text(
                          'Forgot Password?',
                          style: appFont(
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),

                    20.verticalSpace,

                    AppButton(
                      text: 'Login',
                      // height: 50.h,
                      horizontalMargin: 0,
                      onPress: () {
                        Get.offAll(() => const CustomerBottomNav());
                      },
                    ),

                    25.verticalSpace,

                    Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            'OR',
                            style: appFont(color: AppColor.secondaryTextColor),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),

                    20.verticalSpace,

                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignupScreen());
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don’t have an account? ',
                              style: appFont(
                                color: AppColor.secondaryTextColor,
                              ),
                            ),
                            TextSpan(
                              text: 'Sign up',
                              style: appFont(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
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
