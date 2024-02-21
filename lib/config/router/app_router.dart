import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:staditic_trading_app/config/router/app_router_notifier.dart';
import 'package:staditic_trading_app/src/auth/presentation/presentacion.dart';
import 'package:staditic_trading_app/src/home/home.dart';
import 'package:staditic_trading_app/src/operations/presentation/screens/operations_screen.dart';
import 'package:staditic_trading_app/src/settings/presentation/screens/screens.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: goRouterNotifier,
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const CheckAuthStatusScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/detallado',
        builder: (context, state) => const DetalladoScreen(),
      ),
      GoRoute(
        path: '/operations',
        builder: (context, state) => const OperationsScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: '/ui-control',
        builder: (context, state) => const UiControlsScreen(),
      ),
      GoRoute(
        path: '/tutorial',
        builder: (context, state) => const IntroducctionScreen(),
      ),
      GoRoute(
        path: '/theme-change',
        builder: (context, state) => const ThemeScreen(),
      ),
    ],
    redirect: (context, state) {
      final isGoingTo = state.matchedLocation;
      final authStatus = goRouterNotifier.authStatus;

      if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
        return null;
      }

      if (authStatus == AuthStatus.notAuthenticated) {
        if (isGoingTo == '/login' || isGoingTo == '/register') {
          return null;
        }
        return '/login';
      }

      if (authStatus == AuthStatus.authenticated) {
        if (isGoingTo == '/login' ||
            isGoingTo == '/register' ||
            isGoingTo == '/splash') {
          return '/';
        }
      }

      //Mas condiciones, por ejemplo, juego de roles
      return null;
    },
  );
});
