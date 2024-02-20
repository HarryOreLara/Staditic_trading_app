import 'package:flutter/material.dart';
import 'package:staditic_trading_app/config/constants/enviroment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staditic_trading_app/config/router/app_router.dart';
import 'package:staditic_trading_app/config/theme/app_theme.dart';
import 'dart:io';

void main() async {
  await Enviroment.initEnviroment();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: MainApp()));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
