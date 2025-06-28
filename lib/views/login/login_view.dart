import 'package:desafio_flutter/viewmodels/login_view_model.dart';
import 'package:desafio_flutter/views/login/widgets/button_login.dart';
import 'package:desafio_flutter/views/login/widgets/forgot_password.dart';
import 'package:desafio_flutter/views/login/widgets/header.dart';
import 'package:desafio_flutter/views/login/widgets/login_input_field.dart';
import 'package:desafio_flutter/views/login/widgets/login_tabs.dart';
import 'package:desafio_flutter/views/login/widgets/social_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  bool checked = true;
  bool isLoading = false;

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
                      return Header(isSmallScreen: isSmallScreen);
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
                            LoginTabs(
                              onLoginTap: (){},
                              onRegisterTap: (){},
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
                                    validator:
                                        (value) =>
                                            value != null && value.length < 6
                                                ? 'Senha mínima de 6 caracteres'
                                                : null,
                                  ),
                                ],
                              ),
                            ),
                            RemeberPassword(
                              isChecked: checked,
                              onChange: (value) {
                                setState(() {
                                  checked = value!;
                                });
                              },
                              onTap: () {},
                            ),
                            SizedBox(height: isSmallHeight ? 16 : 32),
                          ],
                        ),
                      ),
                      ButtonLogin(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()){
                              setState(() => isLoading = true);
                              final result = await viewModel.login();
                              setState(() => isLoading = false);

                              if (result){
                                // chama outra tela
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Erro ao fazer login')),
                                );
                              }
                            }
                          },
                          isLoading: isLoading,
                      )
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
                      const SizedBox(height: 5),
                      SocialButtons(),
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