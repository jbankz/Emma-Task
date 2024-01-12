import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/app_colors.dart';
import 'textview_widget.dart';

enum ButtonType { fill, outlined }

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? height;
  final double? width;
  final bool loading;
  final Color? buttonColor;
  final Color? buttonOutlinedColor;
  final Color? textColor;
  final double? fontSize;
  final ButtonType? buttonType;
  final String? icon;
  final double? radius;
  final double? elevation;
  final bool enabled;
  final FontWeight? fontWeight;
  final EdgeInsets? edgeInsets;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height = 46,
      this.width,
      this.loading = false,
      this.enabled = true,
      this.buttonType = ButtonType.fill,
      this.buttonColor = AppColors.darkScaffold,
      this.buttonOutlinedColor = AppColors.darkScaffold,
      this.textColor = AppColors.white,
      this.icon,
      this.elevation = .2,
      this.fontSize = 14,
      this.radius = 12,
      this.fontWeight = FontWeight.w500,
      this.edgeInsets});

  @override
  Widget build(BuildContext context) => SizedBox(
      width: width?.w ?? double.infinity,
      height: height?.h,
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation),
              animationDuration: const Duration(milliseconds: 350),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  edgeInsets ?? EdgeInsets.zero),
              backgroundColor:
                  MaterialStateProperty.all(buttonType == ButtonType.fill
                      ? enabled
                          ? buttonColor
                          : AppColors.grey100
                      : AppColors.scaffold),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius!.r),
                      side: BorderSide(
                          color: enabled
                              ? buttonOutlinedColor!
                              : AppColors.grey100)))),
          onPressed: enabled ? (loading ? null : onPressed) : null,
          child: loading
              ? const CupertinoActivityIndicator()
              : (icon != null
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: TextView(
                          text: text,
                          color: textColor,
                          fontWeight: fontWeight,
                          fontSize: fontSize!,
                        )),
                      ],
                    )
                  : TextView(
                      text: text,
                      color: textColor,
                      fontWeight: fontWeight,
                      fontSize: fontSize!))));
}

class AltMenuBtnWidget extends StatelessWidget {
  const AltMenuBtnWidget({super.key, this.onPressed, this.text = 'Not now'});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) => CupertinoButton(
      onPressed: onPressed,
      child: TextView(
          text: text,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
          textAlign: TextAlign.center));
}
