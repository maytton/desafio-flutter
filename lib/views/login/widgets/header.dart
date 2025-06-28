import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool isSmallScreen;

  const Header({super.key, required this.isSmallScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: isSmallScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/tokiologo.png'),
            width: 200,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            'Bem vindo!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Aqui você gerencia seus seguros e de seus familiares \n em poucos cliques!',
            style: TextStyle(color: Colors.white),
            textAlign: isSmallScreen ? TextAlign.start : TextAlign.center,
          ),
        ],
      ),
    );
  }
}
