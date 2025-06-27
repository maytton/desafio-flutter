import 'package:desafio_flutter/viewmodels/login_view_model.dart';
import 'package:provider/provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
];
