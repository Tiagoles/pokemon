import 'package:flutter/material.dart';
import 'form_footer_widget.dart';
import 'form_header_widget.dart';

class FormLayout extends StatelessWidget {

  final String title;
  final Widget body;
  final List<Widget> footerItems;

  const FormLayout({
    super.key,
    required this.title,
    required this.footerItems,
    required this.body
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: <Widget>[
          FormHeaderWidget(title: title),
          Expanded(
            child: body,
          ),
          FormFooterWidget(children:footerItems)
        ],
      ),
    ));
  }

}
