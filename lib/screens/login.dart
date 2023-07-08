import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/auth_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: () => Navigator.pop(context), child: Text("BACK")),
            Text("username:"),
            TextField(controller: usernameController),
            Text("pw:"),
            TextField(controller: passwordController),
            TextButton(
                onPressed: () => context.read<AuthCubit>().login(usernameController.text, passwordController.text),
                child: Text("login")),
          ],
        ),
      ),
    );
  }
}
