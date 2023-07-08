import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/auth_cubit.dart';
import '../funcs/show_banner.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showBanner(context, state.message);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () => Navigator.pop(context), child: Text("BACK")),
              Text("email:"),
              TextField(controller: emailController),
              Text("pw:"),
              TextField(controller: passwordController),
              TextButton(
                  onPressed: () => context.read<AuthCubit>().login(emailController.text, passwordController.text),
                  child: Text("login")),
            ],
          ),
        ),
      ),
    );
  }
}
