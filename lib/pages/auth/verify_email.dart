import 'dart:io';
import 'package:fix_master/controllers/auth/otp_controller.dart';
import 'package:fix_master/pages/auth/login_screen.dart';
import 'package:fix_master/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';
import 'package:fix_master/widgets/app_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
    oc.startTimer();
    super.initState();
  }

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
              'Verify Email',
              style: appFont(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Text(
              'Enter the 4-digit code that we have sent you on email',
              style: appFont(
                fontWeight: FontWeight.w500,
                color: AppColor.secondaryTextColor,
              ),
            ),
            20.verticalSpace,
            Obx(
              () => PinCodeTextField(
                controller: oc.otpController.value,
                length: 4,
                onChanged: (value) {
                  oc.optOnchange(value);
                },
                appContext: context,
                enableActiveFill: true,
                enablePinAutofill: false,
                autoDisposeControllers: false,
                keyboardType: TextInputType.number,
                cursorColor: Colors.white,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textStyle: appFont(fontSize: 28.0, fontWeight: FontWeight.bold),
                autovalidateMode: AutovalidateMode.onUnfocus,
                errorTextSpace: 26,
                errorTextMargin: const EdgeInsets.only(left: 20),
                validator: (otp) => otpValidator(otp.toString()),
                pinTheme: PinTheme(
                  fieldHeight: Platform.isAndroid ? 50.h : 60.h,
                  fieldWidth: Platform.isAndroid ? 50.w : 60.w,
                  borderWidth: 1,
                  borderRadius: BorderRadius.circular(10),
                  shape: PinCodeFieldShape.box,
                  activeColor: Colors.white,
                  selectedColor: AppColor.primaryColor,
                  inactiveColor: Colors.white,
                  errorBorderColor: Colors.red,
                  errorBorderWidth: 1.5,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeBorderWidth: 1.5,
                  inactiveBorderWidth: 1.5,
                  selectedBorderWidth: 1.5,
                ),
              ),
            ),
            Obx(() {
              String timerText =
                  '${oc.minutes.toString().padLeft(2, '0')}:${oc.seconds.toString().padLeft(2, '0')}';
              return Center(
                child: Container(
                  width: 100,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withAlpha(10),
                    border: Border.all(width: 1, color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.solidClock, size: 20.sp),
                      5.horizontalSpace,
                      Text(timerText),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => SizedBox(
          height: Platform.isAndroid ? 100 : 130,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (oc.seconds.value == 60) {
                    // oc.resendOtp(
                    //   isFromSignup: widget.isFromSignup,
                    //   email: widget.email,
                    // );
                  }
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Didn’t received code? ',
                        style: appFont(
                          fontWeight: FontWeight.w500,
                          color: AppColor.secondaryTextColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Resend',
                        style: appFont(
                          color: oc.seconds.value == 60
                              ? AppColor.primaryColor
                              : AppColor.secondaryTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.verticalSpace,
              AppButton(
                text: 'Verify',
                onPress: () {
                  Get.to(() => LoginScreen());
                  // oc.onOtpVerify(
                  //   isFromSignup: widget.isFromSignup,
                  //   email: widget.email,
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
