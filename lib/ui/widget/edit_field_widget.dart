import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'gap.dart';
import 'textview_widget.dart';

class EditFormField extends StatelessWidget {
  final double? height;
  final TextCapitalization? textCapitalization;
  final String? label;
  final String? floatingLabel;
  final String? hint;
  final String? hintRight;
  final Widget? hintRightWidget;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final Widget? prefixWidget;
  final Widget? suffixWidget;

  final FormFieldSetter<String>? onSaved;
  final Function(String)? onChange;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onPasswordToggle;

  final String? initialValue;
  final TextEditingController? controller;
  final FloatingLabelBehavior? floatingLabelBehavior;

  final bool? autocorrect;
  final AutovalidateMode? autoValidateMode;
  final bool? enabled;
  final bool? obscureText;
  final bool? readOnly;
  final bool? alignLabelWithHint;
  final bool? isTyping;

  final bool? clickable;
  final Function()? onTapped;

  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  final Color? focusedColorBorder;
  final Color? enabledBorder;
  final Color? borderSideColor;
  final Color? bgColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputAction? textInputAction;
  final InputDecoration? decoration;
  final Key? formKey;

  final EdgeInsetsGeometry? edgeInsetsGeometry;
  final FocusNode? focusNode;
  final bool filled;
  final bool autoValidate;
  final bool showMaxLengthCounter;
  final int counterLength;
  final double radius;

  final Color? filledColor;
  final TextAlign textAlign;
  final void Function(String)? onFieldSubmitted;

  const EditFormField(
      {super.key,
      this.label = '',
      this.hint,
      this.floatingLabel = '',
      this.prefixIconWidget,
      this.suffixIconWidget,
      this.onSaved,
      this.validator,
      this.enabledBorder = AppColors.deepBlue200,
      this.borderSideColor,
      this.controller,
      this.alignLabelWithHint = false,
      this.onPasswordToggle,
      this.initialValue,
      this.autoValidateMode = AutovalidateMode.onUserInteraction,
      this.autocorrect = true,
      this.enabled = true,
      this.obscureText = false,
      this.readOnly = false,
      this.onTapped,
      this.hintRightWidget,
      this.keyboardType,
      this.textAlign = TextAlign.left,
      this.maxLines = 1,
      this.minLines = 1,
      this.maxLength,
      this.hintRight,
      this.floatingLabelBehavior = FloatingLabelBehavior.never,
      this.inputFormatters,
      this.focusedColorBorder,
      this.suffixIconColor,
      this.labelStyle,
      this.hintStyle,
      this.textStyle,
      this.decoration,
      this.onChange,
      this.edgeInsetsGeometry,
      this.textCapitalization = TextCapitalization.none,
      this.formKey,
      this.bgColor,
      this.focusNode,
      this.textInputAction = TextInputAction.next,
      this.clickable,
      this.prefixWidget,
      this.prefixIconColor,
      this.filled = true,
      this.counterLength = 0,
      this.isTyping = false,
      this.autoValidate = false,
      this.suffixWidget,
      this.height,
      this.filledColor = AppColors.blue200,
      this.showMaxLengthCounter = false,
      this.onFieldSubmitted,
      this.radius = 10});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hint != null)
            Row(
              children: [
                Expanded(
                  child: TextView(
                      text: hint ?? '',
                      fontSize: 12,
                      color: AppColors.hintColor,
                      textAlign: TextAlign.left,
                      fontWeight: FontWeight.w600),
                ),
                if ((hintRight != null) || (hintRightWidget != null))
                  const Spacer(),
                if ((hintRight != null) || (hintRightWidget != null))
                  hintRightWidget ??
                      TextView(
                          text: hintRight ?? '',
                          fontSize: 12,
                          textAlign: TextAlign.right,
                          fontWeight: FontWeight.w500)
              ],
            ),
          if (hint != null) const Gap(height: 8),
          TextFormField(
              readOnly: readOnly!,
              onTap: onTapped,
              key: formKey,
              cursorColor: AppColors.darkBlue,
              keyboardType: keyboardType,
              enabled: enabled,
              focusNode: focusNode,
              textInputAction: textInputAction,
              textCapitalization: textCapitalization!,
              autovalidateMode: autoValidateMode,
              onSaved: onSaved,
              onChanged: onChange,
              maxLines: maxLines,
              inputFormatters: inputFormatters,
              autocorrect: autocorrect!,
              minLines: minLines,
              obscureText: obscureText!,
              maxLength: maxLength,
              validator: validator,
              initialValue: initialValue,
              controller: controller,
              textAlign: textAlign,
              onFieldSubmitted: onFieldSubmitted,
              style: textStyle ??
                  TextStyle(
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp),
              decoration: decoration ??
                  InputDecoration(
                      floatingLabelBehavior: floatingLabelBehavior,
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius.r),
                          borderSide:
                              BorderSide(color: enabledBorder!, width: 0.84.w)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius.r),
                          borderSide: BorderSide(
                              color: focusedColorBorder ?? AppColors.darkBlue)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius.r),
                          borderSide:
                              BorderSide(color: enabledBorder!, width: 1.w)),
                      // border: InputBorder.none,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                              color: const Color(0xffE6EBFA), width: 1.w)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius.r),
                          borderSide: const BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(radius.r),
                          borderSide: const BorderSide(color: Colors.red)),
                      labelText: label,
                      hintStyle: hintStyle,
                      labelStyle: labelStyle,
                      filled: filled,
                      fillColor: filledColor,
                      prefix: prefixWidget,
                      prefixIcon: prefixIconWidget,
                      hintText: hint,
                      alignLabelWithHint: alignLabelWithHint,
                      contentPadding: edgeInsetsGeometry ??
                          EdgeInsets.symmetric(horizontal: 16.w),
                      suffixIcon: suffixWidget,
                      suffix: suffixIconWidget)),
        ],
      );
}
