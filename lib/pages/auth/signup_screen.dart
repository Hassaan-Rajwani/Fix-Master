// ignore_for_file: deprecated_member_use

import 'package:fix_master/pages/customer/dashboard/customer_bottom_nav.dart';
import 'package:fix_master/pages/provider/dashboard/provider_bottom_nav.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';
import 'package:fix_master/widgets/app_button.dart';
import 'package:fix_master/widgets/app_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedRole = 'customer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 🔹 Header Section
            Container(
              width: double.infinity,
              height: 240.h,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColor.primaryColor,
                    AppColor.primaryColor.withOpacity(0.85),
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
                    'Create Account ✨',
                    style: appFont(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Join Fix Master and get started',
                    style: appFont(color: Colors.white.withOpacity(0.9)),
                  ),
                ],
              ),
            ),

            /// 🔹 Signup Card
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppInput(
                      label: 'Full Name',
                      placeHolder: 'Enter your full name',
                      horizontalMargin: 0,
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    AppInput(
                      label: 'Email Address',
                      placeHolder: 'Enter your email',
                      horizontalMargin: 0,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    AppInput(
                      label: 'Phone Number',
                      placeHolder: 'Enter your phone number',
                      horizontalMargin: 0,
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icon(Icons.phone_outlined),
                    ),
                    AppInput(
                      label: 'Password',
                      placeHolder: 'Enter your password',
                      horizontalMargin: 0,
                      showPasswordIcon: true,
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    AppInput(
                      label: 'Confirm Password',
                      placeHolder: 'Re-enter password',
                      horizontalMargin: 0,
                      showPasswordIcon: true,
                      prefixIcon: Icon(Icons.lock_outline),
                    ),

                    16.verticalSpace,

                    Text(
                      'Select Role',
                      style: appFont(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    12.verticalSpace,

                    Row(
                      children: [
                        _roleCard(
                          title: 'Customer',
                          icon: Icons.person,
                          value: 'customer',
                        ),
                        12.horizontalSpace,
                        _roleCard(
                          title: 'Service Provider',
                          icon: Icons.handyman,
                          value: 'provider',
                        ),
                      ],
                    ),

                    16.verticalSpace,

                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'By signing up, you agree to our ',
                            style: appFont(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'Terms & Conditions ',
                            style: appFont(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: appFont(fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: appFont(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),

                    20.verticalSpace,

                    AppButton(
                      text: 'Sign up',
                      horizontalMargin: 0,
                      onPress: () {
                        if (selectedRole == 'customer') {
                          Get.offAll(() => const CustomerBottomNav());
                        } else {
                          Get.offAll(() => const ProviderBottomNav());
                        }
                      },
                    ),

                    25.verticalSpace,

                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Already have an account? ',
                                style: appFont(
                                  color: AppColor.secondaryTextColor,
                                ),
                              ),
                              TextSpan(
                                text: 'Login',
                                style: appFont(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
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
      ),
    );
  }

  /// 🔹 Role Card
  Widget _roleCard({
    required String title,
    required IconData icon,
    required String value,
  }) {
    bool isSelected = selectedRole == value;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedRole = value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColor.primaryColor.withOpacity(0.12)
                : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isSelected ? AppColor.primaryColor : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 26,
                color: isSelected ? AppColor.primaryColor : Colors.grey,
              ),
              6.verticalSpace,
              Text(
                title,
                style: appFont(
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColor.primaryColor : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
