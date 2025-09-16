import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/toastr/toastr_alert_widget.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class ToastrService{

  static void success({
    required BuildContext context,
    required String message,
    String? confirmText,
    VoidCallback? onConfirm,
    String? denyText,
    VoidCallback? onDeny,
    String? cancelText,
    VoidCallback? cancel,
    String? title,
    bool hasIcon = false,
    RichText? richText
  }) {
    FocusScope.of(context).unfocus();
    final (colors, customColors) = (context.colors, context.customColors);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return ToastrAlertWidget(
            richText: richText,
            message: message,
            confirmText: confirmText,
            onConfirm: onConfirm,
            denyText: denyText,
            title: title,
            onDeny: onDeny,
            cancelText: cancelText,
            onCancel: onDeny,
            icon: TablerIcons.circle_check,
            iconColor: customColors.success.color,
            confirmColor: ButtonColor.success,
            cancelColor: ButtonColor.dark,
            titleColor: customColors.success.color,
            hasIcon: hasIcon
        );
      },
    );
  }

  static void info({
    required BuildContext context,
    required String message,
    String? confirmText,
    VoidCallback? onConfirm,
    String? denyText,
    VoidCallback? onDeny,
    String? cancelText,
    VoidCallback? cancel,
    String? title,
    bool hasIcon = false,
    RichText? richText
  }) {
    FocusScope.of(context).unfocus();
    final (color, customColors) = (context.colors, context.customColors);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: color.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return ToastrAlertWidget(
            message: message,
            richText: richText,
            confirmText: confirmText,
            onConfirm: onConfirm,
            denyText: denyText,
            title: title,
            onDeny: onDeny,
            cancelText: cancelText,
            onCancel: onDeny,
            icon: TablerIcons.info_circle,
            iconColor: customColors.info.color,
            confirmColor: ButtonColor.info,
            denyColor: ButtonColor.dark,
            cancelColor: ButtonColor.defaultColor,
            titleColor: customColors.info.color,
            hasIcon: hasIcon
        );
      },
    );
  }

  static void warning({
    required BuildContext context,
    required String message,
    String? confirmText,
    VoidCallback? onConfirm,
    String? denyText,
    VoidCallback? onDeny,
    String? cancelText,
    VoidCallback? cancel,
    String? title,
    bool hasIcon = false,
    RichText? richText
  }) {
    FocusScope.of(context).unfocus();
    final (colors, customColors) = (context.colors, context.customColors);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return ToastrAlertWidget(
          message: message,
          richText: richText,
          confirmText: confirmText,
          onConfirm: onConfirm,
          denyText: denyText,
          onDeny: onDeny,
          cancelText: cancelText,
          onCancel: onDeny,
          icon: TablerIcons.alert_triangle,
          iconColor: colors.tertiary,
          confirmColor: ButtonColor.warning,
          cancelColor: ButtonColor.defaultColor,
          title: title,
          titleColor: colors.tertiary,
          hasIcon: hasIcon
        );
      },
    );
  }

  static void error({
    required BuildContext context,
    required String message,
    String? confirmText,
    VoidCallback? onConfirm,
    String? denyText,
    VoidCallback? onDeny,
    String? cancelText,
    VoidCallback? cancel,
    String? title,
    bool hasIcon = false,
    RichText? richText
  }) {
    FocusScope.of(context).unfocus();
    final (colors, customColors) = (context.colors, context.customColors);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
      ),
      builder: (context) {
        return ToastrAlertWidget(
          richText: richText,
          message: message,
          confirmText: confirmText,
          onConfirm: onConfirm,
          denyText: denyText,
          title: title,
          onDeny: onDeny,
          cancelText: cancelText,
          onCancel: onDeny,
          icon: TablerIcons.xbox_x,
          iconColor: colors.error,
          confirmColor: ButtonColor.danger,
          denyColor: ButtonColor.dark,
          cancelColor: ButtonColor.defaultColor,
          titleColor: colors.error,
          hasIcon: hasIcon
        );
      },
    );
  }

}