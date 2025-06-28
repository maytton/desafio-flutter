import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const ButtonLogin({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -30,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: isLoading ? null : onPressed,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF00C78C), Color(0xFFE6F441)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child:
                isLoading
                    ? const Padding(
                      padding: EdgeInsets.all(12),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                    : const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 28,
                    ),
          ),
        ),
      ),
    );
  }
}
