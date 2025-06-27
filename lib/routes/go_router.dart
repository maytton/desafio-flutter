import 'package:desafio_flutter/routes/app_routes.dart';
import 'package:desafio_flutter/views/login/login_view.dart';
import 'package:go_router/go_router.dart';


final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
          path: '/login',
          name: RouteNames.login,
          builder: (context, state) => const LoginView(),
      ),
    ],
);