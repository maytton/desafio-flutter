import 'package:desafio_flutter/views/home/widgets/add_card_button.dart';
import 'package:desafio_flutter/views/home/widgets/home_header.dart';
import 'package:desafio_flutter/views/home/widgets/menu_button.dart';
import 'package:desafio_flutter/views/shared/app_bar.dart';
import 'package:desafio_flutter/views/shared/drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarCustom(
        onMenuTap: () {
          scaffoldKey.currentState?.openDrawer();
        },
      ),
      drawer: DrawerCustom(),
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.black87,
              child: SingleChildScrollView(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 700),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cotar e Contratar',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    MenuButton(
                                      icon: Icons.directions_car,
                                      label: 'Automóvel',
                                      onTap: () {},
                                    ),
                                    MenuButton(
                                      icon: Icons.home,
                                      label: 'Residencia',
                                      onTap: () {},
                                    ),
                                    MenuButton(
                                      icon: Icons.person,
                                      label: 'Vida',
                                      onTap: () {},
                                    ),
                                    MenuButton(
                                      icon: Icons.health_and_safety,
                                      label: 'Acidentes Pessoais ',
                                      onTap: () {},
                                    ),
                                    MenuButton(
                                      icon: Icons.business,
                                      label: 'Empresa',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Minha Familia',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              AddCardButton(
                                label: 'Adicione aqui os membros da familia',
                                onTap: () {},
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Contratados',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              AddCardButton(
                                label:
                                    'Você ainda não possui seguros contratados.',
                                onTap: () {},
                                icon: Icons.sentiment_dissatisfied,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
