import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({super.key});

  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () async {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('LOGOUT'))
        ],
      ),
    );
  }
}
