import 'package:desafio_flutter/viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider(create: (_) => LoginViewModel(authService: AuthService())),
];
