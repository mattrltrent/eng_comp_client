import 'package:client/core/cubit/auth_cubit.dart';
import 'package:client/core/cubit/query_classes_cubit.dart';
import 'package:client/core/cubit/search_prefs_cubit.dart';
import 'package:client/di.dart';
import 'package:client/screens/error.dart';
import 'package:client/screens/open.dart';
import 'package:client/screens/tab_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router.dart';
import 'core/styles/themes.dart';
import 'funcs/show_banner.dart';

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
        BlocProvider(
          lazy: false,
          create: (context) => sl<QueryClassesCubit>()..loadClasses(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => sl<AuthCubit>()..silentAuth(artificialDelay: true), // TODO
          // create: (context) => sl<AuthCubit>()),
        )
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is Authenticated) {
            router.go('/home', extra: (context.read<AuthCubit>().state as Authenticated));
          } else if (state is NotAuthenticated) {
            // context.read<MessagesCubit>().setState(MessagesLoading());
            router.go('/open');
          } else if (state is AuthFailed) {
            // nothing
            // showBanner(context, state.message);
          } else {
            print(state);
            router.go('/error');
          }
        },
        child: MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          title: "TutorHub",
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);
            return MediaQuery(
              data: data.copyWith(textScaleFactor: 1),
              child: child!,
            );
          },
        ),
      ),
    );
  }
}
