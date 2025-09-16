import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/toastr/snackbar_widget.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class SnackBarService{

  Widget customSnackbar({
    required BuildContext context,
    required String message,
    Color? backgroundColor,
    Color? borderColor,
    double borderWidth = 4.0,
    double cornerRadius = 12.0,
  }) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? colors.surfaceContainer,
          border: Border(
            bottom: BorderSide(color: borderColor ?? colors.inverseSurface, width: 10),
            left: const BorderSide(color: Colors.transparent),
            right: const BorderSide(color: Colors.transparent),
            top: const BorderSide(color: Colors.transparent),
          ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void success({
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    required String message
  }){
    final (colors, customColors) = (context.colors, context.customColors);
    ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: colors.surface.withValues(alpha: 0),
          elevation: 0,
          duration: duration,
          padding: EdgeInsets.zero,
          content: SnackbarWidget(
            duration: duration,
            icon: TablerIcons.circle_check,
            textColor: customColors.success.color,
            backgroundColor: colors.surface,
            progressColor: customColors.success.colorContainer,
            cornerRadius: 4,
            borderColor: customColors.success.colorContainer,
            message: message,
          )
        )
    );
  }

  static void error({
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    required String message
  }){
    final (colors, customColors) = (context.colors, context.customColors);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: colors.surface.withValues(alpha: 0),
            elevation: 0,
            duration: duration,
            padding: EdgeInsets.zero,
            content: SnackbarWidget(
              duration: duration,
              icon: TablerIcons.circle_x,
              textColor: colors.error,
              backgroundColor: colors.surface,
              progressColor: colors.errorContainer,
              cornerRadius: 4,
              borderColor: colors.errorContainer,
              message: message,
            )
        )
    );
  }

  static void warning({
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    required String message
  }){
    final (colors, customColors) = (context.colors, context.customColors);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: colors.surface.withValues(alpha: 0),
            elevation: 0,
            duration: duration,
            padding: EdgeInsets.zero,
            content: SnackbarWidget(
              duration: duration,
              icon: TablerIcons.alert_triangle,
              textColor: colors.tertiary,
              backgroundColor: colors.surface,
              progressColor: colors.tertiaryContainer,
              cornerRadius: 4,
              borderColor: colors.tertiaryContainer,
              message: message,
            )
        )
    );
  }

  static void info({
    required BuildContext context,
    Duration duration = const Duration(seconds: 3),
    required String message
  }){
    final (colors, customColors) = (context.colors, context.customColors);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: colors.surface.withValues(alpha: 0),
            elevation: 0,
            duration: duration,
            padding: EdgeInsets.zero,
            content: SnackbarWidget(
              duration: duration,
              icon: TablerIcons.info_circle,
              textColor: customColors.info.color,
              backgroundColor: colors.surface,
              progressColor: customColors.info.colorContainer,
              cornerRadius: 4,
              borderColor: customColors.info.colorContainer,
              message: message,
            )
        )
    );
  }

}