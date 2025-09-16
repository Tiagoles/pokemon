import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/modals/alert_dialog_widget.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/modals/gallery_dialog_widget.dart';

class ModalActions {

  static showGaleryModal(BuildContext context,
      {required List<File> images, int initialIndex = 0}) {
    final colors = Theme.of(context).colorScheme;
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: colors.scrim,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return GalleryDialogWidget(
          images: images,
          initialIndex: initialIndex,
          scrollDirection: Axis.horizontal,
          showPageIndicator: true,
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static showAlertBottomSheet(
      BuildContext context, {
        required String title,
        required Widget content,
        required List<Widget> actions,
        bool canClose = true,
        Color? textColor,
        Color? backgroundColor,
        Color? iconColor,
        IconData? icon,
      }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: canClose,
      enableDrag: canClose,
      builder: (BuildContext context) {
        return AlertDialogWidget(
          canClose: canClose,
          title: title,
          content: content,
          actions: actions,
          backgroundColor: backgroundColor,
          textColor: textColor,
          iconData: icon,
          iconColor: iconColor,
        );
      },
    );
  }

  static showConfirmDialog(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onCancel,
    String? confirmTextButton,
    bool canClose = true,
    bool closeAutomatically = true,
    required VoidCallback onConfirm,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return showAlertBottomSheet(context,
        canClose: canClose,
        content: PopScope(
          canPop: canClose,
          child: Text(
            message,
            style: textTheme.labelMedium!.apply(color: colors.outline),
            textAlign: TextAlign.center,
          )
        ),
        title: title,
        textColor: colors.tertiaryContainer,
        actions: [
          BootstrapButtonWidget(
            type: ButtonType.outlinedButton,
            text: 'Cancelar',
            size: ButtonSize.small,
            icon: TablerIcons.x,
            color: ButtonColor.dark,
            onPressed: () {
              if(closeAutomatically) Navigator.of(context).pop(false);
              onCancel?.call();
            },
          ),
          BootstrapButtonWidget(
            type: ButtonType.elevatedButton,
            icon: TablerIcons.check,
            color: ButtonColor.warning,
            size: ButtonSize.small,
            text: confirmTextButton ?? 'Confirmar',
            onPressed: () {
              if(closeAutomatically) Navigator.of(context).pop(true);
              onConfirm();
            },
          ),
        ],
        icon: TablerIcons.alert_triangle,
        iconColor: colors.tertiaryContainer);
  }

  static showAcceptDialog(
    BuildContext context, {
    String? cancelText,
    String? confirmText,
    String? denyText,
    ButtonColor? cancelColor,
    ButtonColor? denyColor,
    ButtonColor? confirmColor,
    IconData? cancelIcon,
    IconData? denyIcon,
    IconData? confirmIcon,
    bool canClose = true,
    required String title,
    required String message,
    VoidCallback? onCancel,
    required VoidCallback onConfirm,
    required VoidCallback onDeny,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return showAlertBottomSheet(
      context,
      canClose: canClose,
      content: Text(message,
          style: textTheme.labelMedium!.apply(color: colors.outline)),
      title: title,
      textColor: colors.primary,
      icon: TablerIcons.alert_triangle,
      iconColor: colors.primary,
      actions: [
        BootstrapButtonWidget(
          type: ButtonType.outlinedButton,
          text: cancelText ?? 'Cancelar',
          size: ButtonSize.small,
          icon: cancelIcon ?? TablerIcons.x,
          color: cancelColor ?? ButtonColor.dark,
          onPressed: () {
            Navigator.of(context).pop(false);
            onCancel?.call();
          },
        ),
        BootstrapButtonWidget(
          type: ButtonType.elevatedButton,
          icon: denyIcon ?? TablerIcons.circle_off,
          color: denyColor ?? ButtonColor.danger,
          size: ButtonSize.small,
          text: denyText ?? 'Negar',
          onPressed: () {
            Navigator.of(context).pop(false);
            onDeny();
          },
        ),
        BootstrapButtonWidget(
          type: ButtonType.elevatedButton,
          icon: confirmIcon ?? TablerIcons.check,
          color: confirmColor ?? ButtonColor.primary,
          size: ButtonSize.small,
          text: confirmText ?? 'Aceitar',
          onPressed: () {
            Navigator.of(context).pop(true);
            onConfirm();
          },
        ),
      ],
    );
  }
}
