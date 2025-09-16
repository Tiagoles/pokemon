import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SidenavItemWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final String route;

  const SidenavItemWidget({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    required this.route,
  });

  @override
  State<SidenavItemWidget> createState() => _SidenavItemWidget();
}

class _SidenavItemWidget extends State<SidenavItemWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;
  late final appTheme = Theme.of(context);
  late bool isAble = true;

  @override
  void initState() {
    super.initState();
    isAble = Uri.parse(Modular.to.path).path != widget.route;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this
    );
  }

  void _updateTheme(){
    if(!mounted) return;
    final colors = Theme.of(context).colorScheme;
    _animation = ColorTween(
        begin: colors.primaryContainer.withValues(alpha: 0),
        end: colors.primaryContainer.withValues(alpha: 0.8)
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _updateTheme();
    final colors = Theme.of(context).colorScheme;
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                  color:  isAble ? _animation.value : colors.primaryContainer.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(4)
              ),
              child: ListTile(
                leading: Icon(widget.icon, color: colors.tertiaryContainer),
                title: Text(
                  widget.title,
                  style: appTheme.textTheme.bodyLarge!.apply(color: colors.primaryFixed),
                ),
                onTap: !isAble ? null : () {
                  _controller.forward().whenCompleteOrCancel(() {
                    _controller.reverse();
                    if (widget.onTap!= null) widget.onTap!();
                  });
                },
              ),
            ),
          );
        }
    );
  }
}
