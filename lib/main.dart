import 'package:client/core/cubit/search_prefs_cubit.dart';
import 'package:client/di.dart';
import 'package:client/screens/tab_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/styles/themes.dart';

void main() async => await init().then((_) => runApp(const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => sl<SearchPrefsCubit>(),
        ),
      ],
      child: MaterialApp(
        title: "TootsHub",
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        home: const TabManager(),
      ),
    );
  }
}
