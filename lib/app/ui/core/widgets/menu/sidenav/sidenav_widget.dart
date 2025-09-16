import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/menu/sidenav/sidenav_item_widget.dart';
import 'package:treinamento_flutter/app/ui/core/widgets/menu/sidenav/theme_switch_widget.dart';
import 'package:treinamento_flutter/app/utils/extensions/color_scheme_extension.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';

class SidenavWidget extends StatelessWidget {

  const SidenavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: context.colors.gradientPrimaryLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/brand.png',
                    height: 48,
                  ),
                  IconButton(
                    icon: Icon(TablerIcons.x, color: context.colors.primaryFixed),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                spacing: 16,
                children: [
                  SidenavItemWidget(
                      route: '/home/',
                      icon: TablerIcons.layout_2,
                      title: 'Dashboard',
                      onTap: () {
                        Navigator.pop(context);
                        Modular.to.pushNamed('/home/');
                      }
                  ),
                  const SizedBox(height:64),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
