import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import 'textview_widget.dart';

class AlternativeTilesWidget extends StatelessWidget {
  final String leftText, rightText;
  final Function()? rightTapped;

  const AlternativeTilesWidget(
      {super.key,
      required this.leftText,
      required this.rightText,
      this.rightTapped});

  @override
  Widget build(BuildContext context) => Wrap(
        alignment: WrapAlignment.center,
        children: [
          TextView(
              text: leftText,
              textAlign: TextAlign.center,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              maxLines: 1),
          TextView(
              text: rightText,
              textAlign: TextAlign.center,
              fontSize: 14,
              color: AppColors.darkScaffold,
              fontWeight: FontWeight.w500,
              onTap: rightTapped,
              maxLines: 1),
        ],
      );
}
