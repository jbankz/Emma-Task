import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:intl/intl.dart';

extension ContextExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  void nextFocus([FocusNode? node]) => FocusScope.of(this).requestFocus(node);
  void unfocus({UnfocusDisposition disposition = UnfocusDisposition.scope}) =>
      FocusScope.of(this).unfocus();

  void dismissTrey() => OverlaySupportEntry.of(this)!.dismiss();

  FilteringTextInputFormatter get charactersOnly =>
      FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"));

  LengthLimitingTextInputFormatter limit({int max = 11}) =>
      LengthLimitingTextInputFormatter(max);

  TextInputFormatter get digitsOnly => FilteringTextInputFormatter.digitsOnly;
}

extension NumExt on num {
  String get toNaira => NumberFormat.simpleCurrency(name: 'NGN')
      .format(this)
      .replaceAll(".00", "");
}
