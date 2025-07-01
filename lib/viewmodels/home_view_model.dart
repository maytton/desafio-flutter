import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {

  String? get nomeUsuario => FirebaseAuth.instance.currentUser?.displayName;

}