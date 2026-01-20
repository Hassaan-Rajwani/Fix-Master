import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final forgotPasswordFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> otpController = TextEditingController().obs;

  RxInt seconds = 60.obs;
  RxInt minutes = 0.obs;
  late Timer timer;

  Rx<String>? otpErrorMessage;

  // onForgotPassword() async {
  //   if (forgotPasswordFormKey.currentState?.validate() ?? false) {
  //     final body = {'email': emailController.value.text};
  //     final res = await AuthRepository().forgotPassword(body: body);
  //     if (res['data'] != null && res['success'] == true) {
  // Get.to(
  //   () => VerifyEmailScreen(
  //     isFromSignup: false,
  //     email: emailController.value.text,
  //   ),
  // );
  //     }
  //   }
  // }

  // onResendOtp({required bool isFromSignup, required String email}) async {
  //   final body = {
  //     'email': emailController.value.text != ''
  //         ? emailController.value.text
  //         : email,
  //     'context': isFromSignup
  //         ? VerifyEmail.signup.name
  //         : VerifyEmail.forgot_password.name,
  //   };
  //   await AuthRepository().resendOtp(body: body);
  // }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        update();
      } else {
        if (minutes > 0) {
          minutes--;
          seconds.value = 59;
          update();
        } else {
          timer.cancel();
          seconds.value = 60;
          update();
        }
      }
    });
  }

  // resendOtp({required bool isFromSignup, required String email}) async {
  //   await onResendOtp(isFromSignup: isFromSignup, email: email);
  //   startTimer();
  // }

  optOnchange(String value) {
    if (value.isEmpty) {
      otpErrorMessage!.value = "Please enter OTP";
    } else if (value.length < 4) {
      otpErrorMessage!.value = "Please enter OTP";
    } else {
      otpErrorMessage = null;
    }
  }

  changeOtpError(val) {
    otpErrorMessage!.value = val;
  }

  // onOtpVerify({required bool isFromSignup, required String email}) async {
  //   final sc = Get.put(PatientSetupProfileController(), permanent: true);
  //   final doctorProfile = Get.put(
  //     DoctorSetupProfileController(),
  //     permanent: true,
  //   );
  //   if (otpController.value.text.length != 4) {
  //     changeOtpError('Please Enter Your Otp Code');
  //   }
  //   if (otpFormKey.currentState?.validate() ?? false) {
  //     final body = {
  //       'email': emailController.value.text != ''
  //           ? emailController.value.text
  //           : email,
  //       'otp': otpController.value.text,
  //       'context': isFromSignup
  //           ? VerifyEmail.signup.name
  //           : VerifyEmail.forgot_password.name,
  //     };
  //     final res = await AuthRepository().verifyOtp(body: body);
  //     if (res['data'] != null && res['success'] == true) {
  //       if (isFromSignup) {
  //         if (res['data']['token'] != null) {
  //           await setDataToStorage(StorageKeys.token, res['data']['token']);
  //           GlobalVariable.jwtToken = res['data']['token'];
  //         }
  //         sc.user.value = UserModel.fromJson(res['data']['user']);
  //         doctorProfile.doctor.value = UserModel.fromJson(res['data']['user']);
  //         if (res['data']['user']['role']['name'] == UserType.doctor.name) {
  //           Get.to(() => const DoctorProfileStepper());
  //         } else if (res['data']['user']['role']['name'] ==
  //             UserType.patient.name) {
  //           // showDialog(
  //           //   context: Get.overlayContext!,
  //           //   builder: (context) {
  //           //     return CreatingProfileForDialog();
  //           //   },
  //           // );
  //           Get.to(() => const PatientProfileStepper());
  //         } else {
  //           Get.to(() => StudentSetupProfile());
  //         }
  //       } else {
  //         Get.to(
  //           () => ResetPasswordScreen(
  //             otp: otpController.value.text,
  //             email: emailController.value.text,
  //           ),
  //         );
  //       }
  //     }
  //   }
  // }
}
