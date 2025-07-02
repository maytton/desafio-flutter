import 'package:desafio_flutter/services/auth_service.dart';
import 'package:flutter/material.dart';


class LoginViewModel extends ChangeNotifier {
  final AuthService _authService;

  LoginViewModel({required AuthService authService})
      : _authService = authService;

  String cpf = '';
  String password = '';
  String nome = '';
  bool loading = false;

  void setCpf(String val) {
    cpf = val;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  void setNome(String val) {
    nome = val;
    notifyListeners();
  }

  String get _cpfComoEmail => '$cpf@meuapp.com';


  Future<bool> login() async {
    try {
      loading = true;
      notifyListeners();

      await _authService.login(_cpfComoEmail, password);
      return true;
    } catch (e) {
      debugPrint('Error ao realizar login: $e');
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<bool> register() async {
    try {
      loading = true;
      notifyListeners();

      await _authService.register(_cpfComoEmail, password, nome: nome);
      return true;
    } catch (e) {
      debugPrint('Erro: $e');
      return false;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
