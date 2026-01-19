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
                'Hello There!',
                style: appFont(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Text(
                'Create an account to get started.',
                style: appFont(
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondaryTextColor,
                ),
              ),
              20.verticalSpace,
              AppInput(
                label: 'Full Name',
                placeHolder: 'Enter your full name',
                horizontalMargin: 0,
                // controller: sc.fullnameController.value,
                // validator: (email) => nameValidator(email!),
                // inputFormatters: [
                //   TitleCaseFormatter(),
                //   FilteringTextInputFormatter.allow(
                //     RegexClass.allowAlphabetsOnly,
                //   ),
                // ],
              ),
              AppInput(
                label: 'Email Address',
                placeHolder: 'Enter your email address',
                horizontalMargin: 0,
                // controller: sc.emailController.value,
                // validator: (email) => emailValidator(email!),
                keyboardType: TextInputType.emailAddress,
              ),
              AppInput(
                label: 'Phone Number',
                placeHolder: 'Enter your phone number',
                horizontalMargin: 0,
                // controller: sc.phoneController.value,
                // validator: (email) => phoneValidator(email!),
                keyboardType: TextInputType.number,
              ),
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
              // Obx(
              //   () =>
              AppInput(
                label: 'Confirm Password',
                placeHolder: 'Enter your password',
                horizontalMargin: 0,
                showPasswordIcon: true,
                // obscureText: sc.showConfirmPassword.value,
                // onTap: sc.toggleShowConfirmPassword,
                // controller: sc.confirmPasswordController.value,
                // validator: (password) => passwordValidator(
                //   password.toString(),
                //   password2: sc.passwordController.value.text,
                // ),
                // ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: appFont(fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: 'Terms and Conditions ',
                      style: appFont(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColor.primaryColor,
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
                        decorationColor: AppColor.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              AppButton(
                text: 'Sign up',
                horizontalMargin: 0,
                onPress: () async {
                  // await sc.onSignup();
                },
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
              // Center(
              //   child: SvgPicture.asset(
              //     Platform.isAndroid ? googleIcon : appleIcon,
              //   ),
              // ),
              // 20.verticalSpace,
              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: appFont(
                            fontWeight: FontWeight.w500,
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
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
