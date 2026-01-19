import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fix_master/utils/color_constant.dart';
import 'package:fix_master/utils/font_constant.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    required this.placeHolder,
    this.error = '',
    this.label = '',
    this.keyboardType,
    this.controller,
    this.showPasswordIcon = false,
    this.onTap,
    this.obscureText = false,
    this.validator,
    this.enabled,
    this.horizontalMargin = 20,
    this.borderRadius = 10,
    this.bottomMargin = 15,
    this.verticalPadding = 18,
    this.maxLines = 1,
    this.maxLenght = 100,
    this.prefixIcon,
    this.postfixIcon,
    this.onChanged,
    this.onEnventSumbit,
    this.textarea = true,
    this.backColor,
    this.inputWidth,
    this.onInputTap,
    this.minLine,
    this.focusNode,
    this.isCounterText = false,
    this.isAutoFocus = false,
    this.readOnly = false,
    this.borderColor = AppColor.inputBorderColor,
    this.focusborderColor = AppColor.primaryColor,
    this.inputFormatters = const [],
    super.key,
  });

  final String placeHolder;
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool? showPasswordIcon;
  final VoidCallback? onTap;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onEnventSumbit;
  final bool? enabled;
  final double? horizontalMargin;
  final double? bottomMargin;
  final double? verticalPadding;
  final double? borderRadius;
  final double? inputWidth;
  final int? maxLines;
  final int? maxLenght;
  final Widget? prefixIcon;
  final Widget? postfixIcon;
  final String error;
  final bool textarea;
  final Color? backColor;
  final bool isCounterText;
  final bool isAutoFocus;
  final Color? borderColor;
  final Color? focusborderColor;
  final VoidCallback? onInputTap;
  final bool readOnly;
  final FocusNode? focusNode;
  final int? minLine;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final customInputDecoration = InputDecoration(
      prefixIcon: prefixIcon,
      counterText: isCounterText ? null : '',
      filled: true,
      fillColor: backColor ?? Colors.transparent,
      hintText: placeHolder,
      iconColor: const Color(0xFFD4DDE5),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: verticalPadding!.h,
      ),
      border: const OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: focusborderColor!),
        borderRadius: BorderRadius.circular(borderRadius!.r),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor!),
        borderRadius: BorderRadius.circular(borderRadius!.r),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.errorColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColor.errorColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
      hintStyle: appFont(
        fontWeight: FontWeight.w500,
        color: AppColor.secondaryTextColor,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.r),
      ),
      suffixIcon: showPasswordIcon!
          ? InkWell(
              onTap: onTap,
              child: !obscureText!
                  ? Icon(
                      FontAwesomeIcons.eye,
                      size: 16.sp,
                      color: AppColor.secondaryTextColor,
                    )
                  : Icon(
                      FontAwesomeIcons.eyeSlash,
                      size: 16.sp,
                      color: AppColor.secondaryTextColor,
                    ),
            )
          : postfixIcon,
      errorText: error.isEmpty ? null : error,
      errorStyle: appFont(color: AppColor.errorColor, fontSize: 12.sp),
      counterStyle: appFont(fontSize: 12.sp, color: Colors.white),
      errorMaxLines: 2,
    );

    return Container(
      width: inputWidth,
      margin: EdgeInsets.fromLTRB(
        horizontalMargin!.w,
        0,
        horizontalMargin!.w,
        bottomMargin!.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label! == '')
            Container()
          else
            Text(label!, style: appFont(fontWeight: FontWeight.w500)),
          5.verticalSpace,
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: minLine != null
                ? TextFormField(
                    inputFormatters: inputFormatters,
                    focusNode: focusNode,
                    readOnly: readOnly,
                    onTap: onInputTap,
                    onFieldSubmitted: onEnventSumbit,
                    autofocus: isAutoFocus,
                    style: appFont(
                      fontWeight: FontWeight.w500,
                      color: AppColor.primaryColor,
                    ),
                    keyboardType: keyboardType,
                    controller: controller,
                    onChanged: onChanged,
                    decoration: customInputDecoration,
                    obscureText: obscureText!,
                    validator: validator,
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    enabled: enabled,
                    maxLines: maxLines,
                    maxLength: maxLenght,
                    minLines: 1,
                  )
                : TextFormField(
                    inputFormatters: inputFormatters,
                    focusNode: focusNode,
                    readOnly: readOnly,
                    onTap: onInputTap,
                    onFieldSubmitted: onEnventSumbit,
                    autofocus: isAutoFocus,
                    style: appFont(
                      fontWeight: FontWeight.w500,
                      color: AppColor.primaryColor,
                    ),
                    keyboardType: keyboardType,
                    controller: controller,
                    onChanged: onChanged,
                    decoration: customInputDecoration,
                    obscureText: obscureText!,
                    validator: validator,
                    autovalidateMode: AutovalidateMode.onUnfocus,
                    enabled: enabled,
                    maxLines: maxLines,
                    maxLength: maxLenght,
                  ),
          ),
        ],
      ),
    );
  }
}
