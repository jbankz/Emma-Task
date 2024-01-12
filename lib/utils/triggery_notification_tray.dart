import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';

import '../ui/widget/message_tray.dart';

Future<void> triggerNotification(String message, {bool error = false}) async {
  await HapticFeedback.vibrate();
  showOverlayNotification(
      (context) => MessageNotification(message: message, error: error),
      duration: const Duration(milliseconds: 3500));
}
