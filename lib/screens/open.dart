import 'package:client/screens/login.dart';
import 'package:client/screens/register.dart';
import 'package:flutter/material.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                child: Text("login")),
            TextButton(
                onPressed: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen())),
                child: Text("register")),
          ],
        ),
      ),
    );
  }
}
