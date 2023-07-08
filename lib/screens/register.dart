import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/cubit/auth_cubit.dart';
import '../funcs/show_banner.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController displayNameController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    displayNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    displayNameController.dispose();
    super.dispose();
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
                onPressed: () => context.read<AuthCubit>().register(emailController.text, passwordController.text),
                child: Text("register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
