import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget{
  final VoidCallback onMenuTap;
  const AppBarCustom({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black87,
      leading: IconButton(
        onPressed: onMenuTap,
        icon: const Icon(Icons.menu, color: Colors.white),
      ),
      title: Center(
        child: Image.asset(
          'assets/images/tokiologo.png',
          color: Colors.white,
          width: 150,
          height: 150,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications, color: Colors.white),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
