import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Acesse através das redes sociais',
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.white),
              onPressed: null,
            ),
            SizedBox(width: 16),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
              onPressed: null,
            ),
            SizedBox(width: 16),
            IconButton(
              icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
              onPressed: null,
            ),
          ],
        ),
      ],
    );
  }
}
