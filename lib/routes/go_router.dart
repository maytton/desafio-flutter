import 'package:desafio_flutter/routes/app_routes.dart';
import 'package:desafio_flutter/viewmodels/login_view_model.dart';
import 'package:desafio_flutter/views/login/login_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart' show AuthService;


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
    ],
);