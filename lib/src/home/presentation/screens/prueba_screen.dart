import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:staditic_trading_app/src/home/presentation/widgets/widgets.dart';

class PruebaScreen extends StatefulWidget {
  const PruebaScreen({super.key});

  @override
  State<PruebaScreen> createState() => _PruebaScreenState();
}

class _PruebaScreenState extends State<PruebaScreen> {
  bool ver = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        title: const Text(
          "Detallado",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  ver = !ver;
                });
              },
              // ignore: prefer_const_constructors
              icon: Icon(
                Icons.replay_outlined,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
      ),
      body: Center(child: LineWinrate(isShowingMainData: ver)),
      //body: BarChartSample1(),
    );
  }
}
