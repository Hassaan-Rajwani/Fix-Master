// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:fix_master/controllers/auth/otp_controller.dart';
import 'package:fix_master/pages/auth/login_screen.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';
import 'package:fix_master/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:fix_master/utils/validators.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    required this.isFromSignup,
    required this.email,
  });

  final bool isFromSignup;
  final String email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final oc = Get.put(OtpController());

  @override
  void initState() {
    super.initState();
    oc.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// 🔹 Hero Header
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Email',
                  style: appFont(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                8.verticalSpace,
                Text(
                  'Enter the 4-digit code sent to ${widget.email}',
                  style: appFont(
                    fontSize: 14.sp,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),

          /// 🔹 Card Section
          Expanded(
            child: Transform.translate(
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
                    Obx(
                      () => PinCodeTextField(
                        controller: oc.otpController.value,
                        length: 4,
                        onChanged: oc.optOnchange,
                        appContext: context,
                        enableActiveFill: true,
                        enablePinAutofill: false,
                        autoDisposeControllers: false,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.black,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        textStyle: appFont(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        errorTextSpace: 26,
                        errorTextMargin: const EdgeInsets.only(left: 20),
                        validator: (otp) => otpValidator(otp.toString()),
                        pinTheme: PinTheme(
                          fieldHeight: Platform.isAndroid ? 50.h : 60.h,
                          fieldWidth: Platform.isAndroid ? 50.w : 60.w,
                          borderWidth: 1.5,
                          borderRadius: BorderRadius.circular(10),
                          shape: PinCodeFieldShape.box,
                          activeColor: AppColor.primaryColor,
                          selectedColor: AppColor.primaryColor,
                          inactiveColor: Colors.grey.shade300,
                          activeFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                          selectedFillColor: Colors.white,
                        ),
                      ),
                    ),

                    25.verticalSpace,

                    /// Timer + Resend
                    Obx(() {
                      String timerText =
                          '${oc.minutes.toString().padLeft(2, '0')}:${oc.seconds.toString().padLeft(2, '0')}';
                      return Column(
                        children: [
                          Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "Didn't receive code? ",
                                  style: appFont(
                                    fontSize: 14.sp,
                                    color: AppColor.secondaryTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "Resend",
                                  style: appFont(
                                    fontSize: 14.sp,
                                    color: oc.seconds.value == 60
                                        ? AppColor.primaryColor
                                        : AppColor.secondaryTextColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  // You can add gesture detector inside or wrap
                                ),
                              ],
                            ),
                          ),
                          10.verticalSpace,
                          Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor.withAlpha(10),
                              border: Border.all(color: AppColor.primaryColor),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.solidClock,
                                  size: 18.sp,
                                  color: AppColor.primaryColor,
                                ),
                                5.horizontalSpace,
                                Text(
                                  timerText,
                                  style: appFont(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.w),
        child: AppButton(
          text: 'Verify',
          onPress: () {
            Get.offAll(() => LoginScreen());
            // oc.onOtpVerify(
            //   isFromSignup: widget.isFromSignup,
            //   email: widget.email,
            // );
          },
        ),
      ),
    );
  }
}
