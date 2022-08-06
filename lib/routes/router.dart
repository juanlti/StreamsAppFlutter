import 'package:go_router/go_router.dart';
import 'package:up_movi_devep/config/auth_provider.dart';
import 'package:up_movi_devep/layouts/app_layout.dart';
import 'package:up_movi_devep/layouts/guest_layout.dart';
import 'package:up_movi_devep/pages/loading/loading_page.dart';

import 'package:up_movi_devep/pages/login/login_page.dart';
import 'package:up_movi_devep/pages/splash_screen_page.dart';

class RoutePath {
  static const String home = '/';

  static const String login = '/login';
  static const String loading = '/loading';
  static const String app = '/app';
}

final AuthProvider authProvider = AuthProvider();

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.home,
      builder: (context, state) => GuestLayout(child: LoginPage()),
    ),
    GoRoute(
      path: RoutePath.login,
      builder: (context, state) => GuestLayout(child: LoginPage()),
    ),
    GoRoute(
      path: RoutePath.loading,
      builder: (context, state) => GuestLayout(child: LoadingPage()),
    ),
    GoRoute(
      path: RoutePath.loading,
      builder: (context, state) => const SplasScreen(),
    ),
    GoRoute(
      path: '/app/:fid',
      builder: (context, state) => AppView(
        key: state.pageKey,
        selectContenido: All.unContenido(state.params['fid']!),
        index: 'fid',
      ),
    ),
  ],
  /*
  redirect: (state) {
    final loggedIn = authProvider.authStatus;
    final authLoading = authProvider.authLoading;

    final isLoggedIn = state.location == RoutePath.app;

    final isLoading = state.location == RoutePath.loading;

    print('estoy conectado? $loggedIn');
    print(authLoading);
    print('esta cargando ${isLoading.toString()}');

    if (authLoading) {
      return isLoading ? null : RoutePath.loading;
    }
    if (!authLoading && loggedIn == AuthStatus.notAuthenticated) {
      return isLoggedIn ? null : RoutePath.login;
    }
    if (loggedIn == AuthStatus.authenticated) {
      return isLoggedIn ? null : RoutePath.home;
    }

    return null;
  },
  errorBuilder: (context, state) => ErrorScreen(state.error!),
  refreshListenable: authProvider,
 
*/
  urlPathStrategy: UrlPathStrategy.path,
);
