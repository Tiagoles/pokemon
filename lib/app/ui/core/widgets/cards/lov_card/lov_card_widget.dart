import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/domain/entities/core/lov_entity.dart';

import '../dynamic_card/dynamic_card_widget.dart';

class LovCardWidget extends StatefulWidget {

  final String title;
  final LovEntity data;
  final Widget leading;
  final String index;
  final ValueChanged<LovEntity> onSelected;

  const LovCardWidget({
    super.key,
    required this.title,
    required this.data,
    required this.leading,
    required this.index,
    required this.onSelected,
  });

  @override
  State<LovCardWidget> createState() => _LovCardWidgetState();
}

class _LovCardWidgetState extends State<LovCardWidget> with SingleTickerProviderStateMixin {
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
    _colorAnimation = ColorTween(
        begin: colors.surfaceContainerHighest.withValues(alpha: 0),
        end: colors.surfaceContainerHighest.withValues(alpha: 0.3)
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _){
          return GestureDetector(
            onTap:(){
              _controller.forward().whenComplete(() => _controller.reverse());
              widget.onSelected(widget.data);
            },
            child: DynamicCardWidget(
              title: widget.title,
              data: widget.data.dataList,
              leading: widget.leading,
              index: widget.index,
              backgroundColor: _colorAnimation.value,
            ),
          );
        }
    );
  }
}
