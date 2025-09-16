import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/menu/sidenav/change_theme_button.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colors = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        spacing: 20,
        children: [
          Icon(TablerIcons.palette, color: colors.tertiaryContainer),
          Text('Tema: ', style: textTheme.bodyLarge!.apply(color: colors.primaryFixed)),
          ChangeThemeButton(viewmodel: Modular.get())
        ],
      ),
    );
  }
}
