import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          enableSuggestions: false,
          autocorrect: false,
          decoration: const InputDecoration(
              hintText: 'Enter your email address'),
        ),
        TextField(
          controller: _password,
          decoration:
              const InputDecoration(hintText: 'Enter your password'),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
        ),
        TextButton(
          onPressed: () async {
            final email = _email.text;
            final password = _password.text;
            try {
              final userCredential = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: email, password: password);
              print(userCredential);
            } on FirebaseAuthException catch (ae) {
              print('Auth Exception');
              print(ae.code);
            }
          },
          child: const Text('Login'),
        ),
      ],
    );
  }
}
