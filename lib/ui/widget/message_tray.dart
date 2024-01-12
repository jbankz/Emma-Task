import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import '../common/app_colors.dart';
import 'textview_widget.dart';

class MessageNotification extends StatefulWidget {
  final String message;
  final bool error;

  const MessageNotification(
      {super.key, required this.message, this.error = false});

  @override
  State<MessageNotification> createState() => _MessageNotificationState();
}

class _MessageNotificationState extends State<MessageNotification>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = CurvedAnimation(
        parent: controller, curve: Curves.easeInOut, reverseCurve: Curves.ease);
    controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ScaleTransition(
        scale: animation,
        child: GestureDetector(
          onTap: () => OverlaySupportEntry.of(context)!.dismiss(),
          child: Container(
            width: double.infinity,
            margin:
                EdgeInsets.only(top: kToolbarHeight, left: 16.w, right: 16.w),
            child: Material(
                color: widget.error ? AppColors.red600 : AppColors.darkScaffold,
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextView(
                        text: widget.message,
                        textAlign: TextAlign.left,
                        color: AppColors.scaffold100),
                  ),
                )),
          ),
        ),
      );
}
