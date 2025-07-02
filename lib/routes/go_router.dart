import 'package:desafio_flutter/routes/app_routes.dart';
import 'package:desafio_flutter/viewmodels/login_view_model.dart';
import 'package:desafio_flutter/views/login/login_view.dart';
import 'package:desafio_flutter/views/shared/web_view_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart' show AuthService;
import '../viewmodels/home_view_model.dart';
import '../views/home/home_view.dart';


final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
          path: '/login',
          name: RouteNames.login,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => LoginViewModel(authService: AuthService()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) => ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
          child: const HomeView(),
        )
      ),
      GoRoute(
        path: '/webview',
        name: 'webview',
        builder: (context, state) {
          final url = state.uri.queryParameters['url'] ?? 'https://flutter.dev';
          return WebViewPage(url: url);
        },
      ),
    ],
);