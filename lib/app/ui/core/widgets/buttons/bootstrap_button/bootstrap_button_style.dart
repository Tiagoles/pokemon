import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/utils/extensions/color_extension.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

enum ButtonColor{
  primary, secondary, success, danger, warning, info, light, dark, link,
  defaultColor
}
enum ButtonType{
  textButton, elevatedButton, outlinedButton
}

enum ButtonSize{
  normal, block, large, largeBlock, small, smallBlock
}

typedef MappedColor = ({Color basic, Color hover, Color disabled, Color transparent});

class BootstrapButtonStyle {

  static const Duration animationDuration = Duration(milliseconds: 150);

  static EdgeInsets buttonPadding() {
    return const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    );
  }

  static RoundedRectangleBorder buttonShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.0),
    );
  }

  static TextStyle? getTextSize(ButtonSize size, BuildContext context) {
    final appTheme = Theme.of(context);
    switch (size) {
      case ButtonSize.large || ButtonSize.largeBlock:
        return appTheme.textTheme.titleLarge?.copyWith(fontWeight:
        FontWeight.normal);
      case ButtonSize.small || ButtonSize.smallBlock:
        return appTheme.textTheme.bodySmall?.copyWith(fontWeight:
        FontWeight.normal);
      default:
        return appTheme.textTheme.bodyMedium;
    }
  }

  static MappedColor getMappedColor(ButtonColor color, BuildContext context) {
    switch (color) {
      case ButtonColor.secondary:
        return (
        transparent: context.colors.secondaryContainer.withValues(alpha: 0),
        basic: context.colors.secondaryContainer,
        hover: context.colors.secondaryContainer.hoverColor,
        disabled: context.colors.secondaryContainer.withValues(alpha: 0.5),
        );
      case ButtonColor.success:
        final success = context.customColors.success;
        return (
        transparent: success.colorContainer.withValues(alpha: 0),
        basic: success.colorContainer,
        hover: success.colorContainer.hoverColor,
        disabled: success.colorContainer.withValues(alpha: 0.5),
        );
      case ButtonColor.danger:
        return (
        transparent: context.colors.errorContainer.withValues(alpha: 0),
        basic: context.colors.errorContainer,
        hover: context.colors.errorContainer.hoverColor,
        disabled: context.colors.errorContainer.withValues(alpha: 0.5),
        );
      case ButtonColor.warning:
        return (
        transparent: context.colors.tertiaryContainer.withValues(alpha: 0),
        basic: context.colors.tertiaryContainer,
        hover: context.colors.tertiaryContainer.hoverColor,
        disabled: context.colors.tertiaryContainer.withValues(alpha: 0.5),
        );
      case ButtonColor.info:
        final info = context.customColors.info;
        return (
        transparent: info.colorContainer.withValues(alpha: 0),
        basic: info.colorContainer,
        hover: info.colorContainer.hoverColor,
        disabled: info.colorContainer.withValues(alpha: 0.5),
        );
      case ButtonColor.light:
        return (
        transparent: context.colors.surfaceContainer.withValues(alpha: 0),
        basic: context.colors.surfaceContainer,
        hover: context.colors.surfaceContainer.hoverColor,
        disabled: context.colors.surfaceContainerLow,
        );
      case ButtonColor.dark:
        final neutralDark = context.customColors.neutralDark;
        return (
        transparent: neutralDark.color.withValues(alpha: 0),
        basic: neutralDark.color,
        hover: neutralDark.color.hoverColor,
        disabled: neutralDark.color.withValues(alpha: 0.5),
        );
      case ButtonColor.defaultColor:
        return (
        transparent: context.colors.outline.withValues(alpha: 0),
        basic: context.colors.outline,
        hover: context.colors.outline.hoverColor,
        disabled: context.colors.outline.withValues(alpha: 0.5),
        );
      default:
        return (
        transparent: context.colors.primaryContainer.withValues(alpha: 0),
        basic: context.colors.primaryContainer,
        hover: context.colors.primaryContainer.hoverColor,
        disabled: context.colors.primaryContainer.withValues(alpha: 0.5),
        );
    }
  }

}