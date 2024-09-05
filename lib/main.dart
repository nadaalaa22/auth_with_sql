
import 'package:auth_with_sql/presentation/pages/login_page.dart';
import 'package:auth_with_sql/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_theme.dart';
import 'core/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData, // Use light theme
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}


