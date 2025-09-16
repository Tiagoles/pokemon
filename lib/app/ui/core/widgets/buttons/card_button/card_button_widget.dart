import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class CardButtonWidget extends StatefulWidget {
  final String title;
  final IconData? icon;
  final String? badgeText;
  final VoidCallback onPressed;
  const CardButtonWidget({
    super.key,
    this.icon,
    required this.title,
    required this.onPressed,
    this.badgeText,
  });

  @override
  State<CardButtonWidget> createState() => _CardButtonWidgetState();
}

class _CardButtonWidgetState extends State<CardButtonWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateTheme();
  }

  void _updateTheme(){
    if(!mounted) return;
    final colors = Theme.of(context).colorScheme;
    _colorAnimation = ColorTween(begin: colors.surfaceContainerLow, end: colors.surfaceBright).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.colors;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _){
        return ElevatedButton(
          clipBehavior: Clip.none,
          style: const ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            backgroundColor: WidgetStateColor.transparent,
            shadowColor: WidgetStateColor.transparent,
            overlayColor: WidgetStateColor.transparent
          ),
          onPressed: (){
            _controller.forward().whenComplete(() => _controller.reverse());
            widget.onPressed();
          },
          child: SizedBox(
            width: double.infinity,
            child: badges.Badge(
              badgeStyle: badges.BadgeStyle(
                badgeColor: colors.tertiaryContainer,
              ),
              showBadge: widget.badgeText != null && widget.badgeText!.isNotEmpty,
              position: badges.BadgePosition.topEnd(end: 0),
              badgeContent: Text(widget.badgeText ?? '', style: textTheme.labelSmall!.apply(color: colors.onTertiaryContainer)),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  shadowColor: colors.surfaceContainerLow,
                  shape: Border.all(
                    color: colors.surfaceBright,
                  ),
                  color: _colorAnimation.value,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        if(widget.icon != null) Icon(widget.icon),
                        const SizedBox(height: 8),
                        Text(
                          overflow: TextOverflow.clip,
                          widget.title,
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium!.apply(color: colors.primary)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        );
      }
    );
  }

}
