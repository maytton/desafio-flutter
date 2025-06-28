import 'package:flutter/material.dart';

class RemeberPassword extends StatelessWidget {
  final bool isChecked;
  final Function(bool?) onChange;
  final VoidCallback onTap;

  const RemeberPassword({
    super.key,
    required this.isChecked,
    required this.onChange,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 8,
        spacing: 8,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                value: isChecked,
                onChanged: onChange,
                checkColor: Colors.white,
                activeColor: const Color(0xFF00C78C),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Lembrar senha',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: onTap,
            child: const Text(
              'Esqueceu a senha?',
              style: TextStyle(color: Color(0xFF00C78C)),
            ),
          ),
        ],
      ),
    );
  }
}
