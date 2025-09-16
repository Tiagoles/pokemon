import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/ui/core/viewmodels/theme_viewmodel.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class ChangeThemeButton extends StatefulWidget {

  final ThemeViewmodel viewmodel;

  const ChangeThemeButton({super.key, required this.viewmodel});

  @override
  State<ChangeThemeButton> createState() =>
      _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Alignment> _circleAnimation;

  ThemeViewmodel get _viewmodel => widget.viewmodel;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _circleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final brightness = MediaQuery.platformBrightnessOf(context);
      final isDark = _viewmodel.value == ThemeMode.dark ||
          (_viewmodel.value == ThemeMode.system && brightness == Brightness.dark);

      _animationController.value = isDark ? 1 : 0;
    });

  }

  void _toggleTheme(BuildContext context) {

    _viewmodel.toggleTheme(context);
    _viewmodel.isDarkMode(context) ? _animationController.reverse() : _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _viewmodel,
      builder: (context, mode, _) {

        return GestureDetector(
          onTap: () => _toggleTheme(context),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Container(
                width: 60,
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: _viewmodel.isDarkMode(context)
                      ? colors.primaryContainer
                      : colors.tertiaryContainer,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          TablerIcons.sun,
                          color: _viewmodel.isDarkMode(context)
                              ? colors.onPrimaryContainer
                              : colors.onTertiaryContainer,
                          size: 18,
                        ),
                        Icon(
                          TablerIcons.moon,
                          color: _viewmodel.isDarkMode(context)
                              ? colors.onPrimaryContainer
                              : colors.onTertiaryContainer,
                          size: 18,
                        ),
                      ],
                    ),
                    Align(
                      alignment: _circleAnimation.value,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _viewmodel.isDarkMode(context)
                              ? colors.onPrimaryContainer
                              : colors.onTertiaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
