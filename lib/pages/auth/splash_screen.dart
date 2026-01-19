import 'package:fix_master/pages/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
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

    Future.delayed(const Duration(milliseconds: 1000), () {
      Get.offAll(() => const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: Colors.white,
        child: Center(
          child: Text(
            'Splash Screen',
            style: TextStyle(color: Colors.black, fontSize: 24.sp),
          ),
        ),
      ),
    );
  }
}
