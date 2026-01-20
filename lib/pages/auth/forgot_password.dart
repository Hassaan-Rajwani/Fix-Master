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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.only(top: 70.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Email',
              style: appFont(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Text(
              'Enter your email address to get 4 digit OTP',
              style: appFont(
                fontWeight: FontWeight.w500,
                color: AppColor.secondaryTextColor,
              ),
            ),
            20.verticalSpace,
            AppInput(
              label: 'Email Address',
              placeHolder: 'Enter your email address',
              horizontalMargin: 0,
              // controller: oc.emailController.value,
              // validator: (email) => emailValidator(email!),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: AppButton(
          text: 'Verify',
          horizontalMargin: 20,
          onPress: () async {
            // await oc.onForgotPassword();
            Get.to(
              () => VerifyEmailScreen(
                isFromSignup: false,
                email: 'test@yopmail.com',
              ),
            );
          },
        ),
      ),
    );
  }
}
