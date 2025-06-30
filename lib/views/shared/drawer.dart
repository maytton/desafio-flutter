import 'package:desafio_flutter/services/auth_service.dart';
import 'package:desafio_flutter/views/shared/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.black87),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: FaIcon(FontAwesomeIcons.user, color: Colors.black87),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Text(
                    'Olá, Usuário',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DrawerItem(icon: FontAwesomeIcons.house, title: 'Home / Seguros'),
          DrawerItem(icon: FontAwesomeIcons.fileContract, title: 'Minhas Contratações'),
          DrawerItem(icon: FontAwesomeIcons.triangleExclamation, title: 'Meus Sinistros'),
          DrawerItem(icon: FontAwesomeIcons.peopleGroup, title: 'Minha Família'),
          DrawerItem(icon: FontAwesomeIcons.boxesStacked, title: 'Meus Bens'),
          DrawerItem(icon: FontAwesomeIcons.moneyBillWave, title: 'Pagamentos'),
          DrawerItem(icon: FontAwesomeIcons.shieldHalved, title: 'Coberturas'),
          DrawerItem(icon: FontAwesomeIcons.barcode, title: 'Validar Boleto'),
          DrawerItem(icon: FontAwesomeIcons.phoneVolume, title: 'Telefones Importantes'),
          const Divider(),
          DrawerItem(icon: FontAwesomeIcons.gear, title: 'Configurações'),
          DrawerItem(
            icon: FontAwesomeIcons.rightFromBracket,
            title: 'Sair',
            onTap: () async {
              await AuthService().logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
          ),
        ],
      ),
    );
  }
}
