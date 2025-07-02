import 'package:desafio_flutter/viewmodels/login_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/mock_auth_service.mocks.dart';

void main() {
  late MockAuthService mockAuthService;
  late LoginViewModel vm;

  setUp(() {
    mockAuthService = MockAuthService();
    vm = LoginViewModel(authService: mockAuthService);
  });

  test('Deve atualizar o CPF corretamente', () {
    vm.setCpf('12345678900');
    expect(vm.cpf, '12345678900');
  });

  test('Deve atualizar a senha corretamente', () {
    vm.setPassword('senha123');
    expect(vm.password, 'senha123');
  });

  test(
    'Deve chamar o login do authService com cpf convertido para email',
    () async {
      when(
        mockAuthService.login(any, any),
      ).thenAnswer((_) async => Future.value());

      vm.setCpf('12345678900');
      vm.setPassword('senha123');

      final result = await vm.login();

      expect(result, true);

      verify(
        mockAuthService.login('12345678900@meuapp.com', 'senha123'),
      ).called(1);
    },
  );

  test('Deve chamar o register do authService', () async {
    when(
      mockAuthService.register(any, any),
    ).thenAnswer((_) async => Future.value());

    vm.setCpf('12345678900');
    vm.setPassword('senha123');

    final result = await vm.register();

    expect(result, true);

    verify(
      mockAuthService.register('12345678900@meuapp.com', 'senha123'),
    ).called(1);
  });

  test('Deve retornar false se o register lançar uma exceção', () async {
    when(
      mockAuthService.register(any, any),
    ).thenThrow(Exception('Erro ao registrar usuário'));

    vm.setCpf('12345678900');
    vm.setPassword('senha123');

    final result = await vm.register();

    expect(result, false);
  });

  test('Deve retornar false se o login lançar uma exceção', () async {
    when(mockAuthService.login(any, any)).thenThrow(Exception('Falha no login'));

    vm.setCpf('12345678900');
    vm.setPassword('senha123');

    final result = await vm.login();

    expect(result, false);
  });

}
