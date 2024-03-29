import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:staditic_trading_app/src/home/presentation/widgets/widgets.dart';
import 'package:staditic_trading_app/src/shared/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: SideMenu(scaffoldKey: scaffoldKey),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
              onPressed: () {
                context.push("/settings");
              },
              icon: const Icon(
                Icons.settings,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hola, Harry",
                  style: textStyle.titleLarge,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bienvenido",
                  style: textStyle.titleSmall,
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Divider(),
              const SizedBox(
                height: 20.0,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Win Rate",
                  style: textStyle.titleMedium,
                  textAlign: TextAlign.start,
                ),
              ),
              const PieChartSample2(),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 10.0,
              ),
              BarChartSample1()
            ],
          ),
        ),
      ),
    );
  }
}
