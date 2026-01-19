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
      body: Container(
        padding: EdgeInsets.only(top: 70.h),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: appFont(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Text(
                'Login to continue to your account.',
                style: appFont(
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondaryTextColor,
                ),
              ),
              20.verticalSpace,
              // Obx(
              //   () =>
              AppInput(
                label: 'Email Address',
                placeHolder: 'Enter your email address',
                horizontalMargin: 0,
                // controller: sc.emailController.value,
                // validator: (email) => emailValidator(email!),
              ),
              // ),
              // Obx(
              //   () =>
              AppInput(
                label: 'Password',
                placeHolder: 'Enter your password',
                horizontalMargin: 0,
                showPasswordIcon: true,
                // obscureText: sc.showPassword.value,
                // onTap: sc.toggleShowPassword,
                // controller: sc.passwordController.value,
                // validator: (password) => passwordValidator(password.toString()),
              ),
              // ),
              20.verticalSpace,
              AppButton(
                text: 'Login',
                horizontalMargin: 0,
                onPress: () {
                  Get.offAll(() => const CustomerBottomNav());
                  // sc.onLogin();
                },
              ),
              10.verticalSpace,
              GestureDetector(
                onTap: () {
                  // Get.to(() => ForgotPasswordScreen());
                },
                child: Text(
                  'Forgot Password?',
                  style: appFont(
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor,
                  ),
                ),
              ),
              20.verticalSpace,
              Center(
                child: Text(
                  'Or continue with',
                  style: appFont(
                    fontWeight: FontWeight.w500,
                    color: AppColor.secondaryTextColor,
                  ),
                ),
              ),
              20.verticalSpace,
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SignupScreen());
                  },
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t have an account? ',
                          style: appFont(
                            fontWeight: FontWeight.w500,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
