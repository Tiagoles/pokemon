import 'package:flutter/material.dart';
import 'package:treinamento_flutter/app/utils/extensions/context_extensions.dart';
import 'widgets/loaders/brand_loader.dart';

class LoadPage extends StatelessWidget {
  final String? description;
  const LoadPage({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.errorContainer,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: BrandLoader(
                  width: double.infinity,
                  height: context.screenWidth*0.9
              ),
            ),
            if(description != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  description!,
                  style: context.textTheme.bodyLarge!.apply(color: colors.onPrimaryContainer)
                ),
              )
          ],
        ),
      ),
    );
  }
}
