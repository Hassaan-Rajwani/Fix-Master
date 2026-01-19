import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.onPress,
    this.backgroundColor = AppColor.primaryColor,
    this.buttonLoader = false,
    this.textColor = AppColor.whiteColor,
    this.horizontalMargin = 20,
    this.verticalMargin = 18,
    this.minWidth = 390.0,
    this.borderColor,
    this.showIcon = false,
    this.icon,
    this.borderRadius = 10,
    super.key,
  });

  final VoidCallback? onPress;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool? buttonLoader;
  final double? horizontalMargin;
  final double? verticalMargin;
  final double? borderRadius;
  final double minWidth;
  final Color? borderColor;
  final Widget? icon;
  final bool? showIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin!.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: backgroundColor,
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor ?? Colors.transparent),
                borderRadius: BorderRadius.circular(borderRadius!),
              ),
              textStyle: appFont(fontWeight: FontWeight.w700, fontSize: 16),
              padding: EdgeInsets.symmetric(vertical: verticalMargin!.h),
              elevation: 0,
              minimumSize: Size(minWidth == 0 ? 0 : minWidth, 0),
            ),
            onPressed: buttonLoader! ? null : onPress,
            child: buttonLoader!
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : showIcon! == false
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      text,
                      style: appFont(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: textColor!,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icon!,
                        5.horizontalSpace,
                        Text(
                          text,
                          style: appFont(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: textColor!,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
