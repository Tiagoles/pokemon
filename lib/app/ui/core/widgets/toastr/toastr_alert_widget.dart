import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';
import '../shapes/shapes.d.dart';

class ToastrAlertWidget extends StatelessWidget {
  final String message;
  final String? confirmText;
  final String? denyText;
  final RichText? richText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onDeny;
  final VoidCallback? onCancel;
  final IconData? icon;
  final bool hasIcon;
  final Color? iconColor;
  final ButtonColor? confirmColor;
  final ButtonColor? denyColor;
  final ButtonColor? cancelColor;
  final String? title;
  final Color? titleColor;

  const ToastrAlertWidget({
    super.key,
    required this.message,
    this.confirmText,
    this.title,
    this.denyText,
    this.cancelText,
    this.onConfirm,
    this.onDeny,
    this.onCancel,
    this.icon,
    this.hasIcon = true,
    this.iconColor,
    this.confirmColor,
    this.denyColor,
    this.cancelColor,
    this.titleColor,
    this.richText,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DragDownShapeWidget(),
            const SizedBox(height: 32),
            if (hasIcon) ...[
              Icon(
                icon ?? TablerIcons.info_circle,
                color: iconColor ?? context.colors.primary,
                size: 64,
              ),
              const SizedBox(height: 16),
            ],
            if (title != null) ...[
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.apply(
                  color: titleColor ?? context.customColors.neutralDark.color,
                ),
              ),
              const SizedBox(height: 16),
            ],
            if(richText != null) richText!,
            if(message.isNotEmpty) Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.apply(
                color: context.colors.outline,
              ),
            ),
            if (onConfirm != null) ...[
              const SizedBox(height: 16),
              BootstrapButtonWidget(
                text: confirmText ?? 'Confirmar',
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm!();
                },
                color: confirmColor ?? ButtonColor.primary,
                size: ButtonSize.block,
              ),
            ],
            if (onDeny != null) ...[
              const SizedBox(height: 8),
              BootstrapButtonWidget(
                text: denyText ?? 'Negar',
                onPressed: () {
                  Navigator.of(context).pop();
                  onDeny!();
                },
                color: denyColor ?? ButtonColor.danger,
                size: ButtonSize.block,
              ),
            ],
            const SizedBox(height: 16),
            BootstrapButtonWidget(
              text: cancelText ?? 'Cancelar',
              onPressed: () {
                Navigator.of(context).pop();
                if (onCancel != null) onCancel!();
              },
              color: cancelColor ?? ButtonColor.dark,
              size: ButtonSize.block,
              type: ButtonType.outlinedButton,
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    ))
    ;
  }
}