import 'package:flutter/material.dart';

class LoginTabs extends StatelessWidget {
  final VoidCallback onLoginTap;
  final VoidCallback onRegisterTap;
  final bool isLoginSelected;

  const LoginTabs({
    super.key,
    required this.onLoginTap,
    required this.onRegisterTap,
    required this.isLoginSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onLoginTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Entrar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isLoginSelected ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                height: 2,
                width: 60,
                color: isLoginSelected ? Colors.green : Colors.transparent,
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: onRegisterTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cadastrar',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: !isLoginSelected ? FontWeight.bold : FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Container(
                height: 2,
                width: 60,
                color: !isLoginSelected ? Colors.green : Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
