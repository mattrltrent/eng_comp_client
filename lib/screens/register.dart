import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/auth_cubit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController displayNameController;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    displayNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    displayNameController.dispose();
    super.dispose();
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
            Text("display name:"),
            TextField(controller: displayNameController),
            Text("pw:"),
            TextField(controller: passwordController),
            TextButton(
              onPressed: () => context
                  .read<AuthCubit>()
                  .register(usernameController.text, passwordController.text, displayNameController.text),
              child: Text("register"),
            ),
          ],
        ),
      ),
    );
  }
}
