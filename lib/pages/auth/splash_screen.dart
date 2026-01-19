import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(150),
          child: Text(
            'Splash Screen',
            style: TextStyle(color: Colors.white, fontSize: 24.sp),
          ),
        ),
      ),
    );
  }
}
