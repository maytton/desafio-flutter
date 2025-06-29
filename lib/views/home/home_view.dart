import 'package:desafio_flutter/views/home/widgets/add_card_button.dart';
import 'package:desafio_flutter/views/home/widgets/home_header.dart';
import 'package:desafio_flutter/views/home/widgets/menu_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white),
        ),
        title: Center(
          child: Image(
            image: AssetImage('assets/images/tokiologo.png'),
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
      ),
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
                    return Align (
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
