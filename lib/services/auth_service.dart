import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // logar usuário
  Future<User?> login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      throw Exception('Erro ao realizar login: $e');
    }
  }

  // registrar usuário
  Future<User?> register(String email, String password, {String? nome}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (nome != null && result.user != null) {
        await result.user!.updateDisplayName(nome);
        await result.user!.reload();
      }

      return result.user;
    } catch (e) {
      throw Exception('Erro ao registrar usuário: $e');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  // saber se o usuário está logado
  Stream<User?> get usurStream => _auth.authStateChanges();
}
