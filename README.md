# 📱 Desafio Flutter — Login com Firebase

Aplicativo Flutter desenvolvido como parte do desafio técnico. Possui autenticação com Firebase, layout responsivo, navegação com GoRouter e gerenciamento de estado com Provider (padrão MVVM).

---

## ✅ Funcionalidades Implementadas

- [x] Login com CPF + senha (**funcionando ✅**)
- [x] Cadastro de novo usuário (**funcionando ✅**)
- [x] Validação de campos obrigatórios
- [x] Layout responsivo para telas pequenas
- [x] Navegação com `go_router`
- [x] Gerenciamento de estado com `Provider`
- [x] **Compatível com Android e Web (Flutter Web) ✅**

---

## ⚙️ Requisitos

- Flutter SDK 3.7 ou superior
- Android SDK 35+
- Conta no Firebase com Authentication ativado

---

## 🚀 Como rodar o projeto

### 1. Clone o repositório:

```bash

git clone https://github.com/maytton/desafio-flutter.git
cd desafio-flutter
```

### 2. Instale as dependências:

```bash

flutter pub get
```

### 3. Configure o Firebase:

1. Crie um projeto no Firebase Console
2. Ative o método de login com Email e Senha

### Para Android:
- Adicione o app Android ao Firebase
- Baixe o arquivo google-services.json
- Coloque-o dentro da pasta android/app/

### Para Web:
- Adicione o app Web ao Firebase
- Copie a configuração gerada e cole dentro da tag `<script>` no arquivo `web/index.html`


### 4. Rode o projeto:
```bash

flutter run
```

## 🔐 Autenticação com Firebase
A autenticação foi implementada com:

- Cadastro com CPF (salvo em displayName) e senha
- Login com e-mail e senha
- Feedback visual com SnackBar e CircularProgressIndicator
- Gerenciamento de estado com Provider
- Validação de formulário com GlobalKey<FormState>


## 📦 Principais Pacotes Usados
- firebase_auth
- firebase_core
- provider
- go_router

## ℹ️ Observações
  - O campo principal de login é CPF, mas o Firebase usa e-mail internamente
- O CPF do usuário é salvo no campo displayName do Firebase
- Sem backend próprio — toda autenticação é gerenciada diretamente pelo Firebase
- Projeto desenvolvido como parte de desafio técnico Flutter




