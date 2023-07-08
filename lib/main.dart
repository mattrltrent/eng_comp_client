import 'package:client/screens/open.dart';
import 'package:client/screens/tab_manager.dart';
import 'package:flutter/material.dart';

import 'core/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TootsHub",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      home: const TabManager(),
    );
  }
}
