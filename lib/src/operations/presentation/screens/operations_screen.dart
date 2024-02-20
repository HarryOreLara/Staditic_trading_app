import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Nueva operacion",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
    );
  }
}
