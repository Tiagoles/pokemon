import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shimmer/shimmer.dart';
import 'package:treinamento_flutter/app/plugins/snackbar_service.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/buttons/bootstrap_button/bootstrap_button.d.dart';
import 'package:treinamento_flutter/app/utils/extensions/color_scheme_extension.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';
import 'package:treinamento_flutter/app/utils/extensions/date_time_extensions.dart';

class OrderCard extends StatelessWidget {
  final DateTime dateOpened;
  final String address;
  final String autor;
  final VoidCallback onTap;
  final bool isSyncing;
  final String? error;
  late final ({int months, int days})? difference;

  OrderCard({
    super.key,
    required this.dateOpened,
    required this.address,
    required this.autor,
    required this.onTap,
    this.isSyncing = false,
    this.error
  }){
    difference = dateOpened.getDifferenceBetweenDates(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 2, end: 0),
            badgeContent: Text(
              getDifferenceDate(),
              style: theme.textTheme.labelSmall!.copyWith(
                  color: colors.surface,
                  fontWeight: FontWeight.bold
              ),
            ),
            badgeStyle: badges.BadgeStyle(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                badgeColor: getStatusColor(context),
                shape: badges.BadgeShape.square
            ),
            child: SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: context.colors.gradientPrimaryLight,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                  ),
                  padding: const EdgeInsets.only(
                    top: 26,
                    left: 16,
                    right: 16,
                    bottom: 16
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Aberto em: ${DateFormat('dd/MM/yyyy').format(dateOpened)}',
                          style: theme.textTheme.bodySmall!.apply(color: colors.tertiaryContainer)
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        address,
                        style: theme.textTheme.titleSmall!.apply(color: colors.onPrimaryContainer),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Aberto por: $autor',
                        style: theme.textTheme.bodySmall!.apply(color: colors.onPrimaryContainer),
                      ),
                      const SizedBox(height: 8.0)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (isSyncing)
          Positioned.fill(
            child: Shimmer.fromColors(
              period: const Duration(seconds: 2),
              baseColor: colors.primary.withValues(alpha: 0.3),
              highlightColor: colors.onPrimary.withValues(alpha: 0.8),
              child: Container(
                color: colors.surface.withValues(alpha: 0.3),
              ),
            ),
          ),
        if(error != null && error!.isNotEmpty && !isSyncing)
          Positioned(
            top: -10,
            left: -10,
            child: BootstrapButtonWidget(
              icon: TablerIcons.exclamation_circle,
              color: ButtonColor.danger,
              size: ButtonSize.small,
              paddingVertical: 8,
              paddingHorizontal: 8,
              onPressed: (){
                SnackBarService.error(
                  context: context,
                  message: error!
                );
              },
            )
          ),
      ],
    );
  }

  String getDifferenceDate() {
    String differenceString = 'Há ';

    if(difference!.months > 0) {
      differenceString += '${difference!.months} '
          '${difference!.months > 1 ? 'meses' : 'mês'}';
    }

    if(difference!.days > 0){
      if(difference!.months > 0) differenceString += ' e ';
      differenceString += '${difference!.days} '
          '${difference!.days > 1 ? 'dias' : 'dia'}';
    }
    return difference!.months == 0 && difference!.days == 0 ? 'Lançada Hoje' : differenceString;
  }

  Color getStatusColor(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    if(difference!.months > 0) return colors.errorContainer;
    if(difference!.days >= 10) return colors.tertiaryContainer;
    return context.customColors.success.colorContainer;
  }
}
