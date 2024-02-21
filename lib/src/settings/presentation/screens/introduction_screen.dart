import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroducctionScreen extends StatelessWidget {
  const IntroducctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styleText = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tutorial",
          style: styleText.titleMedium,
        ),
        iconTheme: IconThemeData(color: colors.secondary),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
