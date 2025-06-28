import 'package:desafio_flutter/viewmodels/login_view_model.dart';
import 'package:desafio_flutter/views/login/widgets/login_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}



final _formKey = GlobalKey<FormState>();


class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<LoginViewModel>(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isSmallHeight = height < 700;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF00C78C), Color(0xFFE6F441)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(width: double.infinity, color: Colors.black87),
              ),
            ],
          ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmallScreen = constraints.maxWidth < 600;
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment:
                          isSmallScreen
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/tokiologo.png',
                              width: 200,
                              height: 200,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Bem vindo!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign:
                              isSmallScreen
                                  ? TextAlign.start
                                  : TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Aqui você gerencia seus seguros e de seus familiares \n em poucos cliques!',
                              style: TextStyle(color: Colors.white),
                              textAlign:
                              isSmallScreen
                                  ? TextAlign.start
                                  : TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: isSmallHeight ? 16 : 32),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        width: width < 600 ? width * 0.9 : 400,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              offset: Offset(0, 8),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                TextButton(
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 20),
                                TextButton(
                                  child: Text(
                                    'Cadastrar',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  LoginInputField(
                                    hintText: 'CPF',
                                    onChanged: viewModel.setCpf,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) return 'Informe o CPF';
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  LoginInputField(
                                    hintText: 'Senha',
                                    onChanged: viewModel.setPassword,
                                    isPassword: true,
                                    validator: (value) =>
                                    value != null && value.length < 6
                                        ? 'Senha mínima de 6 caracteres'
                                        : null,
                                  ),
                                ],
                              ),
                            ),

                            Padding(
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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        value: checked,
                                        onChanged: (value) {
                                          setState(() {
                                            checked = value!;
                                          });
                                        },
                                        checkColor: Colors.white,
                                        activeColor: Color(0xFF00C78C),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Lembrar senha',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Esqueceu a senha?',
                                      style: TextStyle(
                                        color: Color(0xFF00C78C),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: isSmallHeight ? 16 : 32),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -30,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState!.validate()){
                                final result = await viewModel.login();
                                if (result){
                                  // proxima tela
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Erro ao fazer login')),
                                  );
                                }
                              }
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF00C78C),
                                    Color(0xFFE6F441),
                                  ],
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
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isSmallHeight ? 16 : 32),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.zero,
                        child: Image.asset(
                          'assets/images/tokiologo.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text(
                        'Acesse através das redes sociais',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 16),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: 16),
                          IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.twitter,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}